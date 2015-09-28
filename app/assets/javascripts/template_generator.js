function generate_stock_item(city_id, item) {
	var href = '/cities/' + city_id + '/item/' + item.id + '/pop_from_city_stock';
	var html = '<li> \
					<a class="pop_link" title="'+ item.name + '" data-remote="true" href="' + href + '"> \
						<div class="item_thumbnail"><img src="/assets/thumbnails/' + item.name + '.png" /></div> \
					</a> \
					<div class="item_amount">' + item.amount + '</div> \
				</li>';
	return html;
}

function generate_user_item(city_id, item) {
	var href = '/cities/' + city_id + '/item/' + item.id + '/push_to_city_stock';
	var html = '<li> \
					<a class="push_link" title="'+ item.name + '" data-remote="true" href="' + href + '"> \
						<div class="item_thumbnail"><img src="/assets/thumbnails/' + item.name + '.png" /></div> \
					</a> \
					<a class="craft_link" title="Move to crafting slot" data-remote="true" href="#" onclick="putItemToSlot(' + item.id + ', \'' + item.name +'\')"> \
						<div class="craft_button"></div> \
					</a> \
				</li>';
	return html;
}
