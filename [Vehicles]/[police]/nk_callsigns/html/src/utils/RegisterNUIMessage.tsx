import { MutableRefObject, useEffect, useRef } from "react";
import noop from "./Noop";

interface NuiMessageData<T = unknown> {
	type: string;
	payload: T;
}

type NuiHandlerSignature<T> = (data: T) => void;

const RegisterNUIMessage = <T extends unknown>(type: string, handler: NuiHandlerSignature<T>) => {
	const savedHandler: MutableRefObject<NuiHandlerSignature<T>> = useRef(noop);

	useEffect(() => {
		savedHandler.current = handler;
	}, [handler]);

	useEffect(() => {
    const eventListener = (event: MessageEvent<NuiMessageData<T>>) => {
			const { type: eventType, payload } = event.data;

			if (savedHandler.current) {
				if (eventType === type) {
					savedHandler.current(payload);
				}
			}
		};

		window.addEventListener("message", eventListener);
		return () => window.removeEventListener("message", eventListener);
	}, [type]);
};;

export default RegisterNUIMessage;
