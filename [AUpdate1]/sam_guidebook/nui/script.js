
var isLoading = false;
let pages;
let currentId = 0;
let editor_open = false;
let pageadd_open = false;
let isAdmin = false;
let isNotify = false;

window.addEventListener('message', function (event) {
    var item = event.data;
    var menuContainer = document.querySelector(".menu-container");
    if (item.type === "hideMenu") {
        $(menuContainer).fadeOut(200, function () {
            menuContainer.style.display = "none";
        });
    } else if (item.type === "showMenu") {
        openMenu();
        pages = item.data;
        var page_container = document.getElementById("pages");
        if (item.admin) {
            isAdmin = true;
            var addpage_btn = document.getElementById("btn_add");
            addpage_btn.style.display = "block";
        }

        page_container.innerHTML = '';
        clearTable();
        pages.sort(function (a, b) {
            return a.page - b.page;
        });
        var currentParent = null;
        for (var i = 0; i < pages.length; i++) {
            var page = pages[i];
            addPage(page.page_name, page.page, page.page_sub);
            if (page.page % 1 === 0) {
                if (currentParent) {
                    page_container.appendChild(currentParent);
                    currentParent = null;
                }
                currentParent = document.createElement("ul");
                var subParagraph = document.createElement("p");
                var subRadioInput = document.createElement("input");
                subRadioInput.type = "radio";
                subRadioInput.name = "choice";
                subRadioInput.id = page.page;
                var subLabel = document.createElement("label");
                subLabel.innerText = page.page_name;
                subParagraph.appendChild(subLabel);

                subParagraph.appendChild(subRadioInput);
                currentParent.appendChild(subParagraph);
            } else {

                var subListItem = document.createElement("li");
                var subRadioInput = document.createElement("input");
                subRadioInput.type = "radio";
                subRadioInput.name = "choice";
                subRadioInput.id = page.page;
                var subLabel = document.createElement("label");
                subLabel.innerText = page.page_name;
                subListItem.appendChild(subLabel);
                subListItem.appendChild(subRadioInput);
                currentParent.appendChild(subListItem);
            }
        }
        if (currentParent) {
            page_container.appendChild(currentParent);
            currentParent = null;
        }
        document.querySelectorAll('input[type="radio"]').forEach(function (radio) {
            radio.addEventListener('change', function () {
                if (this.checked) {
                    toggleLoading(true);
                    var choiceText = '';
                    for (var i = 0; i < pages.length; i++) {
                        if (pages[i].page == this.id) {
                            choiceText = pages[i].data;
                            currentId = pages[i].page;
                            break;
                        }
                    }
                    showEditor(false);
                    setTimeout(function () {
                        updateMenuContent(choiceText);
                        toggleLoading(false);
                    }, 100);
                }
            });
        });
    } else if (item.type === "send_message") {
        showNotify(item.text, false);
    } else if (item.type === "update") {
        pages = item.data;
    }
});

$(document).keyup(function (e) {
    if (e.keyCode === 27) {
        var confirm_box = document.getElementsByClassName("confirm-box")[0];
        if (confirm_box.style.display == "block") {
            confirm_box.style.display = "none";
        } else {
            var menuContainer = document.querySelector(".menu-container");
            hideMenu();
            $(menuContainer).fadeOut(400, function () {
                menuContainer.style.display = "none";
            });
            $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        }
    }
})

function updateMenuContent(content) {
    var menuContent = document.getElementById("menu-text");
    menuContent.innerHTML = content;
    if (isAdmin) {
        var edit_btn = document.getElementById("btn_edit");
        edit_btn.style.display = "block";
        var delete_btn = document.getElementById("btn_delete");
        delete_btn.style.display = "block";
    }
    if (pageadd_open) {
        var add_page = document.getElementById("addpage-container");
        add_page.style.display = "none";
        pageadd_open = false;
    }
}

function toggleLoading(active) {
    var loadingAnimation = document.getElementById("loading-animation");
    if (active) {
        isLoading = true;
        loadingAnimation.style.display = "block";
    } else {
        isLoading = false;
        loadingAnimation.style.display = "none";
    }
}

function addPage(pageName, pageNumber, pageSub) {
    let pagesTable = document.getElementById("pages-table");

    let row = pagesTable.insertRow();
    let nameCell = row.insertCell(0);
    let idCell = row.insertCell(1);
    let subCell = row.insertCell(2);

    nameCell.textContent = pageName;
    idCell.textContent = pageNumber;
    subCell.textContent = (pageSub == 0) ? '×' : '√';
}

function clearTable() {
    let pagesTable = document.getElementById("pages-table");
    let rowCount = pagesTable.rows.length;

    for (let i = rowCount - 1; i >= 1; i--) {
        pagesTable.deleteRow(i);
    }
}

function showEditor(status, data = null) {
    if (status) {
        if (isAdmin) {
            var toolbar = document.getElementById('editor-container');
            toolbar.style.display = "block";
            var btn_save = document.getElementById("btn_save");
            btn_save.style.display = "block";
            editorUtil.setData(data);
            editor_open = true;
            var edit_btn = document.getElementById("btn_edit");
            edit_btn.innerText = enLocales.edit.cancel;
        }
    } else {
        var toolbar = document.getElementById('editor-container');
        toolbar.style.display = "none";
        editor_open = false;
        var edit_btn = document.getElementById("btn_edit");
        edit_btn.innerText = enLocales.edit.edit;
    }
}

function showNotify(message, cancel) {
    var confirm_box = document.getElementsByClassName("confirm-box")[0];
    confirm_box.style.display = "block";
    var text = document.getElementById("confirm-text");
    text.innerText = message;
    var btn_cancel = document.getElementById("btn_cancel");
    if (cancel) {
        btn_cancel.style.display = "block";
        isNotify = true;
    } else {
        btn_cancel.style.display = "none";
        isNotify = false;
    }
}

function handleButtonClick(item) {
    if (item.id == "btn_add") {
        updateMenuContent('');
        var add_page = document.getElementById("addpage-container");
        add_page.style.display = "block";
        pageadd_open = true;
        var edit_btn = document.getElementById("btn_edit");
        edit_btn.style.display = "none";
        var delete_btn = document.getElementById("btn_delete");
        delete_btn.style.display = "none";
        var btn_save = document.getElementById("btn_save_page");
        btn_save.style.display = "block";
        if (editor_open) {
            showEditor(false);
        }
    }
    else if (item.id == "btn_save_page") {
        var pageNameValue = document.getElementById("page_name").value;
        var pageSortValue = document.getElementById("page_sort").value;
        $.post(`https://${GetParentResourceName()}/save_page`,
            JSON.stringify({
                page_name: pageNameValue,
                page_sort: pageSortValue,
            }));
    } else if (item.id == "btn_confirm") {
        if (isNotify) {
            $.post(`https://${GetParentResourceName()}/delete`,
                JSON.stringify({
                    page: currentId,
                }));
            showNotify(enLocales.edit.delete, false);
        } else {

        }
        var confirm_box = document.getElementsByClassName("confirm-box")[0];
        confirm_box.style.display = "none";
    } else if (item.id == "btn_cancel") {
        var confirm_box = document.getElementsByClassName("confirm-box")[0];
        confirm_box.style.display = "none";
    } else {
        var radioButtons = document.querySelectorAll('input[type="radio"]');
        for (var i = 0; i < radioButtons.length; i++) {
            var radioButton = radioButtons[i];
            if (radioButton.checked) {
                var selectedId = radioButton.id;
                if (item.id == "btn_save") {
                    $.post(`https://${GetParentResourceName()}/save`,
                        JSON.stringify({
                            page: selectedId,
                            data: editorUtil.getData()
                        }));
                    updateMenuContent(editorUtil.getData());
                    showNotify(enLocales.edit.save, false);
                    break;
                }
                else if (item.id == "btn_edit") {
                    if (editor_open) {
                        showEditor(false);
                    } else {
                        for (var i = 0; i < pages.length; i++) {
                            if (pages[i].page == currentId) {
                                showEditor(true, pages[i].data);
                                break;
                            }
                        }
                    }
                    break;
                }
                else if (item.id == "btn_delete") {
                    /* var confirm_box = document.getElementsByClassName("confirm-box")[0];
                    confirm_box.style.display = "block"; */
                    showNotify(enLocales.edit.delete_confirm, true);
                    break;
                }
            }
        }
    }

}

function hideMenu() {
    var menuContainer = document.querySelector('.menu-container');
    menuContainer.style.animation = 'close-menu 0.4s ease';
    menuContainer.style.animationFillMode = 'forwards';
    setTimeout(() => {
        menuContainer.style.display = 'none';
        menuContainer.style.animation = '';
    }, 400);
}

function openMenu(){
    var menuContainer = document.querySelector('.menu-container');
    menuContainer.style.display = 'flex';
    menuContainer.style.animation = 'open-menu 0.4s ease';
    menuContainer.style.animationFillMode = 'forwards';
}