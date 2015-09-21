var slots = [];

function putItemToSlot(itemId, itemType) {
	if (slots.length < 3 && slots.indexOf(itemId) == -1) {
		slots.push(itemId);
		var slotContainer = $("#craft_slot_" + slots.length);
		if (slotContainer != null) {
			slotContainer.empty();
			var img = $('<img>'); //Equivalent: $(document.createElement('img'))
			img.attr('src', "/assets/largeThumbnails/" + itemType + ".png");
			slotContainer.append(img);
		}
	}
}

function clearCraftingSlots() {
	for (var i = 1; i <= 3; i++) {
		var slotContainer = $("#craft_slot_" + i);
		if (slotContainer != null) {
			slotContainer.empty();
		}
	}
	slots = [];
}

function craftItem() {
	if (slots.length == 3) {
		$.ajax({
			type: 'GET',
			url: '/craft_item',
			data: {
				'item_0_id': slots[0],
				'item_1_id': slots[1],
				'item_2_id': slots[2]
			}
		});
	}

	for (var i = 1; i <= 3; i++) {
		var slotContainer = $("#craft_slot_" + i);
		if (slotContainer != null) {
			slotContainer.empty();
		}
	}
	slots = [];
}
