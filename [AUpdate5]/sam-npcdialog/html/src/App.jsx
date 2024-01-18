import '../public/css/App.css'

import { useState, useEffect, useMemo } from 'react'
import Emit from './Emit'

import { BsFillChatLeftTextFill } from "react-icons/bs";
import { TiArrowSortedUp } from "react-icons/ti";

const App = () => {
  const [modalQuestion, setModalQuestion] = useState({name: null,job: null,text: null,buttons: null, style: null})
  const [modal, setModal] = useState([])
  const [markers, setMarkers] = useState({})
  const [removeMarkerIndex, setRemoveMarkerIndex] = useState(null)
  const [text, setText] = useState(null)

  const newStyleColors = {
    ["warning"]: "#FFBE71",
    ["error"]: "#FF7171",
    ["success"]: "#71FFF6",
    ["question"]: "#9671FF",
    ["np"]: "#04BF9E",
  }

  const adjustAlpha = (hex, alpha) => {
    hex = hex.replace(/^#/, '');
    let r = parseInt(hex.slice(0, 2), 16);
    let g = parseInt(hex.slice(2, 4), 16);
    let b = parseInt(hex.slice(4, 6), 16);
    let a = parseInt(hex.slice(6, 8), 16) / 255; // Alpha değerini 0 ile 1 arasına çevir
    a = Math.min(Math.max(alpha, 0), 1); // Min 0, max 1
    const newHex = `#${Math.round(r).toString(16).padStart(2, '0')}${Math.round(g).toString(16).padStart(2, '0')}${Math.round(b).toString(16).padStart(2, '0')}${Math.round(a * 255).toString(16).padStart(2, '0')}`;
    return newHex;
  }

  useEffect(() => {
    const message = e => {
      let type = e.data.type
      switch (type) {
        case "OPEN_MODAL":
          setModalQuestion({
            name: e.data.name,
            job: e.data.job,
            text: e.data.text,
            buttons: e.data.buttons,
            style: e.data.style,
          })
          break;
        case "CLOSE_MODAL":
          setModalQuestion({name: null,job: null,text: null,buttons: null, style: null})
          setModal([])
          break;
        case "ADD_MARKER":
          setMarkers((prev) => {
            return {
              ...prev,
              [e.data.index]: {
                id: e.data.index,
                position: e.data.position,
                style: e.data.style,
              },
            }
          })
          break;
        case "REMOVE_MARKER":
          setRemoveMarkerIndex(e.data.index)
          break;
        case "ADD_TEXT":
          setText(e.data.content)
          break;
        case "REMOVE_TEXT":
          setText(null)
          break;
        default: break;
      }
    }

    window.addEventListener('message', message)
    return () => {window.removeEventListener('message', message)}
  }, [])

  useEffect(() => {
    const keyhandle = e => {
      if (e.key == 'Escape') {
        Emit('modalClose', {}, () => {})
      }else {
        Object.keys(modalQuestion.buttons).sort().map((key) => {
          const modalButton = modalQuestion.buttons[key]
          if (modalButton.button == e.key) {
            setModalQuestion((prev) => {
              return {
                ...prev,
                buttons: {
                  ...prev.buttons,
                  [key]: {
                    ...prev.buttons[key],
                    selected: true,
                  },
                },
              };
            });
            setTimeout(() => {
              Emit('modalCallback', {option: key}, () => {})
            }, 250);
          }
        })
      }
    }

    window.addEventListener('keyup', keyhandle)
    return () => {window.removeEventListener('keyup', keyhandle)}
  }, [[], modalQuestion])

  useEffect(() => {
    if (modalQuestion.name !== null) {
      setModal(renderModal(modalQuestion.name, modalQuestion.job, modalQuestion.text, modalQuestion.buttons, modalQuestion.style))
    }
  }, [modalQuestion])

  useEffect(() => {
    if (removeMarkerIndex !== null) {
      setTimeout(() => {
        setMarkers((prev) => {
          const updatedMarkers = { ...prev };
          delete updatedMarkers[removeMarkerIndex];
          return updatedMarkers;
        })
        setRemoveMarkerIndex(null)
      }, 250);
    }
  }, [removeMarkerIndex, markers])

  useEffect(() => {
    if (Object.keys(modal).length > 0 && document.getElementsByClassName('app')[0] != undefined) {
      document.getElementsByClassName('app')[0].style.background = `radial-gradient(50% 100% at 50% 50%, ${adjustAlpha(newStyleColors[modalQuestion.style], 0.00)} 0%, ${adjustAlpha(newStyleColors[modalQuestion.style], 0.15)} 100%)`
    }else if (document.getElementsByClassName('app')[0] == undefined) {
      document.getElementsByClassName('others')[0].style.background = 'none'
    }
  }, [modal, modalQuestion])

  const renderModal = (name, job, text, buttons, style) => {
    if (style == "np") {
      return (
        <div className="modal">
          <div className="modal-header">
            <div className="npc-name">
            <span id='fn'>{name.firstname}</span>
              <span id='ln'>{name.lastname}</span>
            </div>
            <div className="npc-job">
              <span>{job}</span>
            </div>
          </div>
  
          <div className="modal-text">
            <span>{text}</span>
            <TiArrowSortedUp className='icon' />
          </div>
  
          <div className="modal-buttons">
          {
            Object.keys(buttons).sort().map((key) => {
              const button = buttons[key]
              return (
                <div className={`button ${button.selected ? 'select' : ''}`} key={key} onClick={e => (
                  setModalQuestion((prev) => {
                    return {
                      ...prev,
                      buttons: {
                        ...prev.buttons,
                        [key]: {
                          ...prev.buttons[key],
                          selected: true,
                        },
                      },
                    };
                  }),
                  setTimeout(() => {
                    Emit('modalCallback', {option: key}, () => {})
                  }, 250)
                )}>
                  <div className={`select-button ${button.selected ? 'select' : ''}`}>
                    <span>{button.button}</span>
                  </div>
                  <span>{button.label}</span>
                </div>
              )
            })
          }
          </div>
        </div>
      )
    }else {
      const newStyle = newStyleColors[style] ? newStyleColors[style] : "#04BF9E"
      return (
        <div className="modal" style={{
          background: '#000000',
          border: `.25vh solid ${adjustAlpha(newStyle, 0.5)}`,
          width: '65vh',
          fontFamily: 'Inter, sans-serif'
        }}>
          <div className="modal-header">
            <div className="npc-name">
              <BsFillChatLeftTextFill className='icon' style={{
                color: '#fff',
                transform: 'unset',
                position: 'unset',
                marginRight: '1vh',
              }} />
              <span>{name.firstname}</span>
              <span>{name.lastname}</span>
            </div>
            <div className="npc-job" style={{
              background: adjustAlpha(newStyle, 0.25),
            }}>
              <span style={{
                color: newStyle,
              }}>{job}</span>
            </div>
          </div>
  
          <div className="modal-text" style={{
            background: 'rgba(37, 37, 37, 0.52)',
            border: '.25vh solid rgba(255, 255, 255, 0.20)',
            borderRadius: '.5vh'
          }}>
            <span style={{
              fontWeight: '600',
              color: '#A0A0A0'
            }}>{text}</span>
            <TiArrowSortedUp className='icon' style={{
              color: '#fff'
            }} />
          </div>
  
          <div className="modal-buttons">
          {
            Object.keys(buttons).sort().map((key) => {
              const button = buttons[key]
              return (
                <div className={`button ${button.selected ? 'select' : ''}`} key={key} onClick={e => (
                  setModalQuestion((prev) => {
                    return {
                      ...prev,
                      buttons: {
                        ...prev.buttons,
                        [key]: {
                          ...prev.buttons[key],
                          selected: true,
                        },
                      },
                    };
                  }),
                  setTimeout(() => {
                    Emit('modalCallback', {option: key}, () => {})
                  }, 250)
                )} style={{
                  background: 'rgba(255, 255, 255, 0.35)',
                  border: '.25vh solid rgba(255, 255, 255, 0.45)',
                  fontWeight: '600'
                }}>
                  <div className={`select-button ${button.selected ? 'select' : ''} new`} style={{
                    background: '#FFFFFF'
                  }}>
                    <span style={{
                      color: '#000000',
                      textShadow: 'unset',
                      fontWeight: 'bold',
                    }}>{button.button}</span>
                  </div>
                  <span style={{
                    color:'#FFFFFF'
                  }}>{button.label}</span>
                </div>
              )
            })
          }
          </div>

          <div className="modal-shadows">
            <div className="modal-shadow" style={{background: adjustAlpha(newStyle, 1)}}></div>
          </div>

          <div className="modal-bottom-line"></div>

        </div>
      )
    }
  }

  const renderMarker = useMemo(() => {
    return Object.keys(markers).sort().map((key) => {
      const marker = markers[key]
      const fadeOut = key == removeMarkerIndex ? 'fadeOut' : null
      const style = newStyleColors[marker.style] ? newStyleColors[marker.style] : "#04BF9E"
      return (
        <div className={`marker ${fadeOut}`} key={key} style={{zoom: `${(marker.position.d * 2) / 16}`, left: `${marker.position.x * 100}%`,top: `${(marker.position.y * 100)}%`,right: `${marker.position.x * 100}%`,bottom: `${(marker.position.y * 100)}%`,position: 'absolute',}}>
          <svg width="100" height="100" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path
                d="M100 50C100 77.6142 77.6142 100 50 100C22.3858 100 0 77.6142 0 50C0 22.3858 22.3858 0 50 0C77.6142 0 100 22.3858 100 50ZM3.09837 50C3.09837 75.9031 24.0969 96.9016 50 96.9016C75.9031 96.9016 96.9016 75.9031 96.9016 50C96.9016 24.0969 75.9031 3.09837 50 3.09837C24.0969 3.09837 3.09837 24.0969 3.09837 50Z" 
                fill={adjustAlpha(style, 0.25)}
              />
              <g filter="url(#filter0_d_436_5)">
                  <circle cx="50" cy="50" r="14" fill={style}/>
              </g>
              <defs>
                  <filter id="filter0_d_436_5" x="11" y="11" width="78" height="78" filterUnits="userSpaceOnUse" colorInterpolationFilters="sRGB">
                    <feFlood floodOpacity="0" result="BackgroundImageFix"/>
                    <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                    <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_436_5" result="shape"/>
                  </filter>
              </defs>
          </svg>
        </div>
      )
    })
  }, [markers, removeMarkerIndex])

  const renderText = useMemo(() => {
    if (text == null) return null
    const style = newStyleColors[text.style] ? newStyleColors[text.style] : "#04BF9E"
    return (
      <div className="interactive" style={{
        position: 'absolute',
        left: `${text.x * 100}%`,
        top: `${text.y * 100}%`,
        right: `${text.x * 100}%`,
        bottom: `${text.y * 100}%`,
      }}>
        <div className="i-button" style={{
          background: adjustAlpha(style, 0.25),
          borderColor: adjustAlpha(style, 0.5),
          boxShadow: `0px 0px .75vh ${adjustAlpha(style, 0.5)}`,
        }}>
          <span>{text.l}</span> 
          <div className="bottom" style={{
            background: style,
            boxShadow: `0px 0px .75vh ${adjustAlpha(style, 0.75)}`,
          }}></div>
        </div>
        <div className="i-text" style={{
          background: `linear-gradient(180deg, ${adjustAlpha(style, 0.0)} 0%, ${adjustAlpha(style, 0.25)} 100%)`,
        }}>
          <span>{text.t}</span>
        </div>
      </div>
    )
  }, [text])

  return (
      Object.keys(modal).length <= 0 ? (
        <div className="others">{renderMarker}{renderText}</div>
      ) : (
        <div className="app fadeIn">{modal}</div>
      )
    
  )
}

export default App
