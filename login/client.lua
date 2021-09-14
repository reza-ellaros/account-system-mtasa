
sw,sh = guiGetScreenSize()



back2 = guiCreateStaticImage( 0.1, 0, 0.8, 0.9, "aks/2.png", true, background)

edit2 = guiCreateEdit(  0.385, 0.4, 0.2, 0.07, "", true,back2 )
edit1 = guiCreateEdit( 0.385, 0.3, 0.2, 0.07, "", true,back2 )
but12 = guiCreateStaticImage( 0.385, 0.5, 0.2, 0.07, "aks/3.png", true, back2)
but1 = guiCreateButton( 0.385, 0.5, 0.2, 0.07, "login", true,back2 )
but22 = guiCreateStaticImage(0.385, 0.6, 0.2, 0.07, "aks/4.png", true, back2)
but2 = guiCreateButton( 0.385, 0.6, 0.2, 0.07, "register", true,back2 )
forget = guiCreateLabel( 0.44, 0.75, 0.2, 0.07, "",true, back2 )
guiLabelSetColor( forget, 0,0,0 )
editt1 = guiCreateEdit(  0.385, 0.25, 0.2, 0.07, "", true,back2 )
editt2 = guiCreateEdit(  0.385, 0.35, 0.2, 0.07, "", true,back2 )


editt3 = guiCreateEdit(  0.385, 0.45, 0.2, 0.07, "", true,back2 )
butt12 = guiCreateStaticImage(0.385, 0.55, 0.2, 0.07, "aks/4.png", true, back2)
butt1 = guiCreateButton(  0.385, 0.55, 0.2, 0.07, "register", true,back2 )
butt22 = guiCreateStaticImage(0.385, 0.65, 0.2, 0.07, "aks/5.png", true, back2)
butt2 =  guiCreateButton(  0.385, 0.65, 0.2, 0.07, "back", true,back2 )
showChat( false )


showPlayerHudComponent("all", false)

guiSetAlpha(for3,0)
guiSetAlpha(for5,0)
guiSetAlpha( butt2, 0 )
guiSetAlpha( butt1, 0 )
guiSetAlpha( but1, 0 )
guiSetAlpha( but2, 0 )

guiSetVisible( editt1, false )
guiSetVisible( editt2, false )
guiSetVisible( editt3, false )
guiSetVisible( butt1, false )
guiSetVisible( butt2, false )
guiSetVisible( butt22, false )
guiSetVisible( butt12, false )
guiSetVisible( edit1, false )
guiSetVisible( edit2, false )
guiSetVisible( but1, false )
guiSetVisible( but2, false )
guiSetVisible(forget,false)
guiSetVisible( but22, false )
guiSetVisible( background, false )


function onstart()


    showCursor( true )
    guiSetVisible(background,true)
    guiSetVisible(edit2,true)
    guiSetVisible(edit1,true)
    guiSetVisible(but1,true)
    guiSetVisible(but2,true)
    guiSetVisible(forget,true)
    guiSetVisible(but22,true)

end
addEventHandler("onClientResourceStart",root,onstart)

function onlogin()

    guiSetVisible( back2, false )
    showCursor(false)
showChat( true )
showPlayerHudComponent("radar", true)
end

addEvent("onlogin",true) 
addEventHandler("onlogin",root,onlogin)

function onclick()
    if (source == but2) then 
        guiSetVisible( editt1, true )
        guiSetVisible( editt2, true )
        guiSetVisible( editt3, true )
        guiSetVisible( butt1, true )
        guiSetVisible( butt12, true )
        guiSetVisible( butt2, true )
        guiSetVisible( butt22, true )

        guiSetVisible( edit1, false )
        guiSetVisible( edit2, false )
        guiSetVisible( but1, false )
        guiSetVisible( but12, false )
        guiSetVisible( but2, false )
        guiSetVisible(forget,false)
        guiSetVisible( but22, false )        
    elseif (source == butt2) then 
        guiSetVisible( editt1, false )
        guiSetVisible( editt2, false )
        guiSetVisible( editt3, false )
        guiSetVisible( butt1, false )
        guiSetVisible( butt12, false )
        guiSetVisible( butt2, false )
        guiSetVisible( butt22, false )

        guiSetVisible( but12, true )
        guiSetVisible( edit1, true )
        guiSetVisible( edit2, true )
        guiSetVisible( but1, true )
        guiSetVisible( but2, true )
        guiSetVisible( forget, true )
        guiSetVisible( but22, true )        
    elseif (source == but1) then 
        user = guiGetText(edit1)
        pass = guiGetText(edit2)
        log = triggerServerEvent("logj",getLocalPlayer(),getLocalPlayer(),user,pass)

    elseif (source == butt1) then 
        user2 = guiGetText(editt1)
        pass2 = guiGetText(editt2)
        repass = guiGetText(editt3)
        reg = triggerServerEvent("regj",getLocalPlayer(),getLocalPlayer(),user2,pass2,repass)
        
    end
end
addEventHandler("onClientGUIClick",root,onclick)




