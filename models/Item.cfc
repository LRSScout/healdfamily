/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	

	/**
	 * Constructor
	 */
	Item function init(){

		return this;
	}

	/**
	 * getItem
	 */
	function getItem(){

	}

	/**
	 * updateItem
	 */
	function updateItem(event, rc, prc){
		updateItem = queryExecute("
			update items
			set 
				name = '#rc.name#',
				value = '#rc.value#',
				itemTypeID = '#rc.itemTypeID#',
				image = 'image',
				description = '#description#',
				encumbrances = '#encumbrances#'
			where itemID = #rc.itemID#

		")
	}

	/**
	 * addItem
	 */
	function addItem(event, rc, prc){
		addItem = queryExecute("
			insert into items(name,value,itemTypeID,image,description,encumbrances)
			values('#rc.name#',#rc.value#,'#rc.itemTypeID#','image','#rc.description#','#rc.encumbrances#')
		");
		return addItem;
	}

	/**
	 * deleteItem
	 */
	function deleteItem(event, rc, prc){
		deleteItem = queryExecute("
			delete from items
			 where itemID = #rc.itemID#
		")
		return deleteItem
	}

	/**
	 * listItems
	 */
	function listItems(event, rc, prc){
		items = queryExecute("
			select *
			from items, itemType
			where items.itemTypeID = itemType.itemTypeID
		")
		return items;
	}

	function getItemTypes(event, rc, prc){
		itemTypes = queryExecute("
			Select *
			from itemType
		")
		return itemTypes;
	}


}