t=tmr.create()
lcd=nil
x=0
y=0



tmr.alarm(0,500, tmr.ALARM_SINGLE, function()  
    i2c.setup(0, 3, 4, i2c.SLOW)
tmr.alarm(1,500, tmr.ALARM_SINGLE, function()  
    lcd = require("lcd1602")()
tmr.alarm(2,500, tmr.ALARM_SINGLE, function()  
    lcd.put(lcd.locate(0, 0), "XXXXXXXXXXXXXXXX")
    lcd.put(lcd.locate(1, 0), "XXXXXXXXXXXXXXXX")

    t:register(3000, tmr.ALARM_AUTO, function() executa() end)
    t:start()

end)end)end)




function executa()

x=x+1
if x>5 then 
    x=1
end

if x==1 then
    print("Clear")
    lcd.clear()
elseif x==2 then
    y=y+1
    print("Apaga")
    lcd.light(false)
elseif x==3 then
    print("Ascende")
    lcd.light(true)
elseif x==4 then
    print("Mensagem 1")
    lcd.put(lcd.locate(0, 3), "Ta na hora")
elseif x==5 then
    print("Mensagem 2")
    lcd.put(lcd.locate(1, 4), "da RAID")
end

if y>=2 then
   print("Fim")
   t:unregister()
end
end





--lcd.put(lcd.locate(0, 7), "Hallo!")
--lcd.put(lcd.locate(0, 8), "Hallo!")

--function notice() 
--   print(node.heap()) 
--   lcd.run(0, "Hallo Wereld!", 150, 1, notice) 
--end 
--notice()
