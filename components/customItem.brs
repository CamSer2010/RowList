sub init()
    m.layoutGroup = m.top.findNode("layoutGroup")
    m.label = m.top.findNode("label")
    m.posterUser = m.top.findnode("posterUser")
    m.posterEdit = m.top.findnode("posterEdit")
end sub

sub onItemContentChanged()
    m.item = m.top.itemContent
    m.label.text = m.item.TITLE 
    m.posterUser.uri = m.item.HDPOSTERURL  
    if m.item.description = "down" then
        m.posterEdit.opacity = "1"
    else 
        m.posterEdit.opacity = "0.4"
    end if
    ?"TITULO";m.item
end sub

sub onItemHasFocus()
    if m.top.focusPercent > 0.5 then
        m.posterEdit.visible = "true"


        m.posterUser.opacity = "1"
        m.label.opacity = "1"
    else
        m.posterEdit.visible = "false"
        m.posterUser.opacity = "0.4"
        m.label.opacity = "0.4"
    end if
end sub