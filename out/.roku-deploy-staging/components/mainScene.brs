sub init()
      m.rowlist = m.top.findNode("rowlist")
      m.rowlist.setFocus(true)
      m.rowList.observeField("itemSelected", "onProfileSelected")
      m.top.observeField("visible", "OnVisibleChange")
      m.top.observeField("focusedChild", "OnFocusedChild")
      m.rowlist.observeField("rowItemFocused", "onRowItemFocused")
      m.rowlist.observeField("rowItemSelected", "onRowItemSelected")
      
      
      loadMenuItemsTask()
  end sub
  
  sub loadMenuItemsTask()
    
      m.contentTask = CreateObject("roSGNode", "contentTask")
      m.contentTask.observeField("output", "onContentReady")
      m.contentTask.control = "RUN"
      ?"CARGANDO"
      ?"CONTENT";m.contentTask

  end sub
  
  sub onContentReady()

      m.rowlist.content = m.contentTask.output
      m.contentTask.control = "STOP"
      m.contentTask.unobserveField ("output")
      m.contentTask = invalid
      'm.rowlist.observeField("rowItemFocused", "onItemFocused")
     
      ?"HIJO",
  end sub

sub onRowItemFocused(event as Object)
    rowItemFocused = event.getData()
    m.itemFocused = m.rowlist.content.getChild(rowItemFocused[0]).getChild(rowItemFocused[1])
    m.itemFocused.description = "rowlist"
    ?"ITEM_SELECTED",m.itemFocused.description
end sub

sub onRowItemSelected()
    rowItemSelected = m.rowlist.rowItemSelected
    ?"INDICE-SELECT",rowItemSelected
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    ?"key -- "key; "press "; press
    result = false
    if press then 
       m.itemFocused.description = key
    end if 
    return result
end function