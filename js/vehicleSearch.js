//filter button in the mobile view
//if click on the filter button and width is equal
//to the mobile view and if filter div is display
//then disable it else filter div hide
//if on resize function adds to avoid hide div
//when resize from mobile view to pc view
const toggleFilter = () =>{
	const toggleBtn = document.getElementById('filter-toggle');
	const filterContainer = document.querySelector('.filter-container');
	toggleBtn.addEventListener('click', ()=>{
		if(window.screen.width <= 760){
			if (filterContainer.style.display == 'initial') {
				filterContainer.style.display = 'none';
			}else{
				filterContainer.style.display = 'initial';
			}
		}
	});
	window.addEventListener('resize', () =>{
		if(window.screen.width > 760){
			filterContainer.style.display = 'initial';
		}
	});
}
toggleFilter();
// animte searched item function

function animateSrchItem(){
	let items = document.querySelectorAll(".searched-item");
	items.forEach((link, index)=>{
		link.style.animation =``;
		link.offsetWidth;
		link.style.animation = link.style.animation = `FadeUp 0.25s ease forwards ${index / 5 + .01}s`;;
	});
}

//change the active statement of the navigation button when
//click on it and remove it from the other active class
var btn_nav = document.getElementById('page-navigation');
var btns = btn_nav.getElementsByClassName("pge-btn");
for(let i=0; i<btns.length; i++){
	btns[i].addEventListener("click", () => {
		let current = btn_nav.getElementsByClassName("pge-btn active");
		current[0].classList.remove('active');
		btns[i].classList.add('active');
		animateSrchItem()
	});
}

//hide the selector for the advanced search bar
//vehicle type input
var selector = document.getElementById('selection');
var selectitems = selector.getElementsByClassName('select-item')
var input = document.getElementById("vehicle-type");
for(let i=0; i<selectitems.length; i++){
	selectitems[i].addEventListener("click", () =>{
		let current = selector.getElementsByClassName("select-item active");
		current[0].classList.remove('active');
		selectitems[i].classList.add('active');
		input.value = selectitems[i].innerHTML;
	});
}

//changes the grid view and list view if list view button clicked
//then check already is it in the grid view if it is then change 
//the class name to the list view same goes to the grid view
//button clicked
animateSrchItem()

var container = document.getElementById("listingContent");
var otherBtn = document.getElementById('grid-view');
function changeListGrid(thisID){	
	if(thisID.id == 'list-view'){
		if(container.className == 'searched-content grid-view'){
			container.classList.remove('grid-view');
			container.classList.add('list-view');
			thisID.classList.add('active');
			otherBtn.classList.remove('active');
			otherBtn.disabled = false;
			thisID.id.disabled = true;
			animateSrchItem()
		}
	}
	else if(thisID.id == 'grid-view'){
		if(container.className == 'searched-content list-view'){
			container.classList.remove('list-view');
			container.classList.add('grid-view');
			thisID.classList.add('active');
			let otherBtn = document.getElementById('list-view');
			otherBtn.classList.remove('active');
			otherBtn.disabled = false;
			thisID.disabled = true;
			animateSrchItem()
		}
	}
}

//changes the checked statuse when change the value of checkbox checked
function changeCheck(elementName){
	if(elementName.checked == true) {
		elementName.classList.add('checked');
	}
	else if (elementName.checked == false) {
		elementName.classList.remove('checked');
	}
}


