import { useEffect, useRef } from "react";
import noop from "./Noop";

type FrameVisibleSetter = (bool: boolean) => void;

const LISTENED_KEYS = ["Escape"];

const UseExitListener = (visibleSetter: FrameVisibleSetter) => {
	const setterRef = useRef<FrameVisibleSetter>(noop);

	useEffect(() => {
		setterRef.current = visibleSetter;
	}, [visibleSetter]);

	useEffect(() => {
		const keyHandler = (e: KeyboardEvent) => {
			if (LISTENED_KEYS.includes(e.code)) {
				setterRef.current(false);
			}
		};

		window.addEventListener("keyup", keyHandler);

		return () => window.removeEventListener("keyup", keyHandler);
	}, []);
};

export default UseExitListener;
