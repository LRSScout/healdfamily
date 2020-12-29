$(document).ready(function(event){
    var editItemLink = $(".editItemLink")
    var editItem = $(".editItem")
    var myModal = $("#myModal")

    editItem.click(function(event){
        event.preventDefault()

        // get my item values
        var myItemID = $(this).data('itemid')
        var myName = $(this).data('name')
        var myValue = $(this).data('value')
        var itemTypeID = $(this).data('itemtypeid')
        var myDescription = $(this).data("description")
        var myEncumbrances = $(this).data("encumbrances")
        
        // set item values to modal form fields
        $("#itemID").val(myItemID)
        $("#name").val(myName)
        $("#value").val(myValue)
        $("#itemTypeID").val(itemTypeID)
        $("#description").val(myDescription)
        $("#encumbrances").val(myEncumbrances)

        $("#submitButton").html("Update Item")

        myModal.modal("show")    
    })

    console.dir($("#itemTypeID"))
});
