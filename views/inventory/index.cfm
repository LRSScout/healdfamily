<cfoutput>

<table class="table table-striped table-hover table-bordered">
    <thead>
        <tr>
            <th scope="col" class="text-center"><a href="##"><i class="fas fa-plus-square" title="Add Item" data-toggle="modal" data-target="##myModal"></a></i></th>
            <th scope="col">
                Name
            </th>
            <th scope="col">
                Type
            </th>
            <th scope="col">
                Image
            </th>
            <th scope="col">
                Description
            </th>
            <th scope="col">
                Encumbrances
            </th>
            <th scope="col">
                Value
            </th>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="prc.items">
            <tr>
                <td class="text-center">
                    <a href="##" class="editItemLink"><i class="fas fa-edit editItem" title="Edit Item" data-itemid="#prc.items.itemID#" data-name="#prc.items.name#" data-value="#prc.items.value#" data-itemtypeid="#prc.items.itemTypeID#" data-description="#prc.items.description#" data-encumbrances="#prc.items.encumbrances#"></i></a>
                    <a href="<cfoutput>#event.buildLink("inventory/delete")#?itemID=#prc.items.itemID#</cfoutput>"><i class="fas fa-trash" title="Delete Item"></i></a>
                </td>
                <td>
                    #prc.items.name#
                </td>
                <td>
                    #prc.items.itemType#
                </td>
                <td>
                    #prc.items.image#
                </td>
                <td>
                    #prc.items.description#
                </td>
                 <td>
                    #prc.items.encumbrances#
                </td>
                <td>
                    #dollarFormat(prc.items.value)#
                </td>
            </tr>
        </cfoutput>
    </tbody>
</table>
</cfoutput>
<br />
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Item</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body">
        <div class="container">
        <form name="itemForm" id="itemForm" action="<cfoutput>#event.buildLink("inventory/update")#</cfoutput>" method="post" enctype="multipart/form-data">
            <input type="hidden"name="itemID" id="itemID" value="0">
             <div class="form-row">
                <div class="col col-sm-12">
                    <div class="form-group">
                        <label for="Name">Name</label>
                        <input type="text" name="name" id="name" class="form-control">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col col-sm-12">                    
                    <div class="form-group">
                        <label for="value">Value</label>
                        <input type="number" name="value" id="value" class="form-control">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col col-sm-6">
                    <div class="form-group">
                        <label for="type">Type</label>
                        <select name="itemTypeID" id="itemTypeID" class="form-control">
                            <option value"0"> </option>
                            <cfoutput query="prc.getItemTypes">
                                <option value="#itemTypeID#">#itemType#</option>
                            </cfoutput>
                        </select>
                    </div>
                </div>
                <div class="col col-sm-6">
                    <div class="form-group">
                        <label for="image">Image</label>
                        <input type="file" name="image" id="image" class="form-control-file">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col col-sm-12">
                    <div class="form-group">
                        <label for="description">Description</label>
                        <br />
                        <textarea name="description" id="description" style="width:100%;" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col col-sm-12">
                    <div class="form-group">
                        <label for="description">Encumbrances</label>
                        <br />
                        <textarea name="encumbrances" id="encumbrances" style="width:100%;" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" id="submitButton" class="btn btn-primary">Add Item</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </form>
      </div>
    </div>
  </div>
</div>
