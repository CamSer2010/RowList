sub init()
    m.top.functionName = "getContent"
    ?"ROWLIST TASK (TopUser) RUNNING"
end sub

sub getContent()
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setUrl("https://raw.githubusercontent.com/jack1590/Roku/master/Netflix/mock/profile.json")
    urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.InitClientCertificates()
    stringBody = urlTransfer.getToString()
    data = parseJson(stringBody)
    
    content = createObject("roSGNode", "ContentNode")
    section= content.createChild("ContentNode")
    ?"API"data
        
    
    for i = 0 to data.profile.items.count() - 1

        profile = data.profile.items[i]
        
        itemContentNode = section.createChild("ContentNode")
        itemContentNode.title = profile.name
        itemContentNode.HDPOSTERURL = profile.poster

    end for
    
    m.top.output = content
  
  end sub

