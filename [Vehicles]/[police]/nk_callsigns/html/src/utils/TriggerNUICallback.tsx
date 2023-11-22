const resourceName = (window as any).GetParentResourceName
	? (window as any).GetParentResourceName()
	: "nafing_script";

export default async function TriggerNUICallback<T>(
	eventName: string,
	data?: unknown
): Promise<T> {
	try {
		const resp = await fetch(`https://${resourceName}/${eventName}`, {
			method: "post",
			headers: {
				"Content-Type": "application/json; charset=UTF-8",
			},
			body: JSON.stringify(data),
		});

		const respFormatted = await resp.json();

		return respFormatted;
	} catch (error) {
		throw Error(`Failed to fetch NUI callback ${eventName}! (${error})`);
	}
}
