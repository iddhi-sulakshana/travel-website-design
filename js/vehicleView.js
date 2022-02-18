//uses to change image in the main image view, when 
//click on the image it changes main image source to 
//the clicked image url
const changeImage = () => {
	const main_image = document.getElementById('main-image');
	const container = document.querySelector('.grid-images');
	const list = container.querySelectorAll('.sub-image');
	for(let i=0; i<list.length; i++){
		list[i].addEventListener('click', () => {
			main_image.src = list[i].src;
		});
	}
}
changeImage();

//This get the current date assign it to the checkin date
//when chekin data changed check if checkin value is none
//then disable checkout else check if checkout vale is less
//than checkin value set checkout value to the checkin value
//and after if set checkout min to checkin value to disable
//users to select date behind the check out and undisable checkout
const changeDate = () => {
	//date format yyyy-mm-dd
	const date = new Date();
	const today = date.getFullYear() + "-" + (date.getMonth()+1)  + "-" + date.getDate()+1;
	const checkin = document.getElementById('datein');
	const checkout = document.getElementById('dateout');
	checkin.valueAsDate = new Date();
	checkin.min = checkout.min = checkin.value;
	checkin.addEventListener('change', () => {
		if(checkin.value == ""){
			checkout.disabled = true;
		}else{
			if(checkout.value < checkin.value){
				checkout.value = checkin.value; 
			}
			checkout.min = checkin.value; 
			checkout.disabled = false;
		}
	});
}
changeDate();