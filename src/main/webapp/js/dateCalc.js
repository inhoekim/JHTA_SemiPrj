function getday(checkIn,checkOut){
	day = (new Date(checkOut) - new Date(checkIn)) / (1000 * 60 * 60 * 24);
	return Math.ceil(day);
}

function getTotalPrice(checkIn,checkOut,price){
	let day = getday(checkIn,checkOut);
	return day * price;
}
