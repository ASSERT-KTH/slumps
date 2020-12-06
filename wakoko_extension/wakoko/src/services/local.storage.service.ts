export default class LocalStorageService
{
	timeout: number = 3000;

	setNumberofBypassedBlocks(val: number){
		localStorage.setItem(`WAKOKO_BYPASSED_BLOCKS`, `${val}`);

		setTimeout(() => {
			window.location.reload()
		}, this.timeout)
	}

	getNumberofBypassedBlocks(){
		return parseInt(localStorage.getItem(`WAKOKO_BYPASSED_BLOCKS`) || '0');
	}

	setSavingUrl(val: string){
		localStorage.setItem(`WAKOKO_SAVING_HOST`, `${val}`);

		setTimeout(() => {
			window.location.reload()
		}, this.timeout)
	}

	getSavingHost(){
		return localStorage.getItem(`WAKOKO_SAVING_HOST`) || '';
	}


	toggleStatsInjection(val: boolean){

		if(val)
			localStorage.setItem(`WAKOKO_INJECT_STATS`, `true`);
		else
			localStorage.removeItem("WAKOKO_INJECT_STATS");

		setTimeout(() => {
			window.location.reload()
		}, 500)
	}

	isStatsInjected(): boolean{
		return !!localStorage.getItem(`WAKOKO_INJECT_STATS`)
	}
}