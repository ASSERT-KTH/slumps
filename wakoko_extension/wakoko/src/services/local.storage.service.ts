export default class LocalStorageService
{
	setNumberofBypassedBlocks(val: number){
		localStorage.setItem(`WAKOKO_BYPASSED_BLOCKS`, `${val}`);

		setTimeout(() => {
			window.location.reload()
		}, 2000)
	}

	getNumberofBypassedBlocks(){
		return parseInt(localStorage.getItem(`WAKOKO_BYPASSED_BLOCKS`) || '0');
	}
}