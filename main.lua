clicksource = love.audio.newSource("blipSelect.wav", "static")
winsource = love.audio.newSource("pickupCoin.wav", "static")
tiesource = love.audio.newSource("powerUp.wav", "static")
losesource = love.audio.newSource("hitHurt.wav", "static")

cx = 1
cy = 1
c2x = 2
c2y = 1

intextbox = false
textbox = ""

sx = 0
sy = 0
ex = 800
ey = 600

tie = "tie ):"
xw = "X WINS!"
ow = "O WINS!"

multiplayertype = "none"

scene = "select type"

blw = 3
blw2 = 5

borde = {{"", "", ""}, {"", "", ""}, {"", "", ""}} -- creates the boread idk how to speel

turn = "x" -- x starts

state = "idle" -- the state | idle, X WINS!, O WINS!, tie ):

function gotoscene(inscene) 
    scene = inscene
    print(inscene)
    if scene == "game" then
        borde = {{"", "", ""}, {"", "", ""}, {"", "", ""}}
        turn = "x"
        state = "idle"
    end
end

function ismousein(x1, y1, x2, y2)
    local mx = love.mouse.getX()
    local my = love.mouse.getY()
    if mx > x1 and mx < x2 and my > y1 and my < y2 then
        print("mouse in " .. x1 .. " " .. y1 .. " " .. x2 .. " " .. y2)
        return true
    else
        return false
    end
end

function whosturn(borde)
    local x, o = 0, 0
    for i = 1, 3 do
        for j = 1, 3 do
            if borde[i][j] == "x" then 
                x = x + 1
            elseif borde[i][j] == "o" then
                o = o +1
            end

        end
    end

    if x > o then
        return "o"
    else
        return "x"
    end
end

function love.load()
    smallfont = love.graphics.newFont(20) -- small font
    midfont = love.graphics.newFont(50) -- midium font
    bigfont = love.graphics.newFont(100) -- big font
end

function love.keypressed(key)
    if intextbox then
        print(key)
        if key == "backspace" then
            textbox = textbox:sub(1, -2)
        if key == "return" then
            intextbox = false
            gotoscene("game")
        elseif key == "0" or key == "1" or key == "2" or key == "3" or key == "4" or key == "5" or key == "6" or key == "7" or key == "8" or key == "9" or key == "." then
            textbox = textbox .. key
        end
    end
end

function love.mousepressed(x, y)
    if scene == "game" then
        if borde[cy][cx] == "" and state == "idle" then
            borde[cy][cx] = turn

            turn = whosturn(borde)

            -- and time for the pain
            -- x
            if borde[1][1] == "x" and borde[2][1] == "x" and borde[3][1] == "x" then -- pain 1 :D
                state = xw
                sx, sy, ex, ey = 100, 100, 100, 300
            elseif borde[1][2] == "x" and borde[2][2] == "x" and borde[3][2] == "x" then -- pain 2 :)
                state = xw
                sx, sy, ex, ey = 200, 100, 200, 300
            elseif borde[1][3] == "x" and borde[2][3] == "x" and borde[3][3] == "x" then -- pain 3 :|
                state = xw
                sx, sy, ex, ey = 300, 100, 300, 300

            elseif borde[1][1] == "x" and borde[1][2] == "x" and borde[1][3] == "x" then -- pain 4 :(
                state = xw
                sx, sy, ex, ey = 100, 100, 300, 100
            elseif borde[2][1] == "x" and borde[2][2] == "x" and borde[2][3] == "x" then -- pain 5 D:
                state = xw
                sx, sy, ex, ey = 100, 200, 300, 200
            elseif borde[3][1] == "x" and borde[3][2] == "x" and borde[3][3] == "x" then -- pain 6 |:<
                state = xw
                sx, sy, ex, ey = 100, 300, 300, 300

            elseif borde[1][1] == "x" and borde[2][2] == "x" and borde[3][3] == "x" then -- pain 7 ):<
                state = xw
                sx, sy, ex, ey = 100, 100, 300, 300
            elseif borde[1][3] == "x" and borde[2][2] == "x" and borde[3][1] == "x" then -- pain 8 D:<
                state = xw
                sx, sy, ex, ey = 100, 300, 300, 100

            -- o
            elseif borde[1][1] == "o" and borde[2][1] == "o" and borde[3][1] == "o" then -- pain 1 :D
                state = ow
                sx, sy, ex, ey = 100, 100, 100, 300
            elseif borde[1][2] == "o" and borde[2][2] == "o" and borde[3][2] == "o" then -- pain 2 :)
                state = ow
                sx, sy, ex, ey = 200, 100, 200, 300
            elseif borde[1][3] == "o" and borde[2][3] == "o" and borde[3][3] == "o" then -- pain 3 :|
                state = ow
                sx, sy, ex, ey = 300, 100, 300, 300

            elseif borde[1][1] == "o" and borde[1][2] == "o" and borde[1][3] == "o" then -- pain 4 :(
                state = ow
                sx, sy, ex, ey = 100, 100, 300, 100
            elseif borde[2][1] == "o" and borde[2][2] == "o" and borde[2][3] == "o" then -- pain 5 D:
                state = ow
                sx, sy, ex, ey = 100, 200, 300, 200
            elseif borde[3][1] == "o" and borde[3][2] == "o" and borde[3][3] == "o" then -- pain 6 |:<
                state = ow
                sx, sy, ex, ey = 100, 300, 300, 300

            elseif borde[1][1] == "o" and borde[2][2] == "o" and borde[3][3] == "o" then -- pain 7 ):<
                state = ow
                sx, sy, ex, ey = 100, 100, 300, 300
            elseif borde[1][3] == "o" and borde[2][2] == "o" and borde[3][1] == "o" then -- pain 8 :D
                state = ow
                sx, sy, ex, ey = 100, 300, 300, 100

            elseif borde[1][1] ~= "" and borde[2][1] ~= "" and borde[3][1] ~= "" and borde[1][2] ~= "" and borde[2][2] ~= "" and borde[3][2] ~= "" and borde[1][3] ~= "" and borde[2][3] ~= "" and borde[3][3] ~= "" then -- PAIN 69420! O:<
                state = tie -- tie
            end -- pain ended :D

            if state == xw then
                love.audio.play(winsource)
            end
            if state == ow then
                love.audio.play(losesource)
            end
            if state == "idle" then
                love.audio.play(clicksource)
            end
            if state == tie then
                love.audio.play(tiesource)
            end
        end
        if state ~= "idle" and love.mouse.getY() > 500 then
            gotoscene("game")
        end
    elseif scene == "select type" then
        if ismousein(200, 250, 600, 350) then
            gotoscene("game")
        elseif ismousein(200, 350, 400, 450) then
            gotoscene("host")
            multiplayertype = "host"
        elseif ismousein(400, 350, 600, 450) then
            gotoscene("client")
            multiplayertype = "client"
        end
    elseif scene == "host" then
        if ismousein(200, 250, 600, 350) then
    end
end

function love.update() -- gets the mouse pos of the borde like 1 2 3
    if love.mouse.getX() < 400 and love.mouse.getX() >= 100 and love.mouse.getY() < 400 and love.mouse.getY() >= 100 then
        cx = math.floor(love.mouse.getX()/100)
        cy = math.floor(love.mouse.getY()/100)
    end
end

function love.draw()
    love.graphics.setFont(smallfont)
    love.graphics.print(scene, 0, 0)
    love.graphics.print(multiplayertype, 200, 0)
    if scene == "game" then
        if turn == "x" then -- color
            love.graphics.setColor(0.1, 0.2, 0.1 ,1)
        else
            love.graphics.setColor(0.2, 0.1, 0.1 ,1)
        end
        if state == tie then
            love.graphics.setColor(0.2, 0.2, 0.1 ,1)
        elseif state == xw then
            love.graphics.setColor(0.1, 0.2, 0.1 ,1)
        elseif state == ow then
            love.graphics.setColor(0.2, 0.1, 0.1 ,1)
        end
        love.graphics.rectangle("fill", 100, 100, 300,300) -- draws the borde background
        love.graphics.setFont(bigfont)
        for y = 1, 3 do
            for x = 1, 3 do
                if borde[y][x] == "x" then -- color
                    love.graphics.setColor(0, 1, 0 ,1)
                else
                    love.graphics.setColor(1, 0, 0 ,1)
                end
                love.graphics.print(borde[y][x], (x*100)+20, (y*100)-15)
            end
        end

        if turn == "x" then -- color
            love.graphics.setColor(0, 1, 0 ,1)
        else
            love.graphics.setColor(1, 0, 0 ,1)
        end
        if state == tie then
            love.graphics.setColor(1, 1, 0, 1)
        elseif state == xw then
            love.graphics.setColor(0, 1, 0 ,1)
        elseif state == ow then
            love.graphics.setColor(1, 0, 0 ,1)
        end
        love.graphics.print("Turn " .. turn, 100, 0)
        love.graphics.line(200, 100, 200, 400) -- lines
        love.graphics.line(300, 100, 300, 400)
        love.graphics.line(100, 200, 400, 200)
        love.graphics.line(100, 300, 400, 300)
        if state ~= "idle" then
            love.graphics.setFont(midfont)
            love.graphics.print(state, 500, 100)

            love.graphics.setFont(bigfont)
            love.graphics.print("RESET", 200, 500)

            love.graphics.setLineWidth(blw)

            love.graphics.line(0, 500, 800, 500)

            love.graphics.line(0, 400, 100, 500)
            love.graphics.line(800, 400, 700, 500)

            love.graphics.line(100, 0, 0, 100)
            love.graphics.line(700, 0, 800, 100)

            love.graphics.setLineWidth(1)

            if state ~= tie then
                love.graphics.setLineWidth(blw2)
                love.graphics.setColor(1, 1, 1, 0.5)
                love.graphics.line(sx+50, sy+50, ex+50, ey+50)
                love.graphics.setLineWidth(blw)
                love.graphics.setColor(0, 1, 1, 1)
                love.graphics.line(sx+50, sy+50, ex+50, ey+50)
                love.graphics.setLineWidth(1)
            end
        else
            love.graphics.setLineWidth(blw)
            love.graphics.line(0, 500, 100, 600)
            love.graphics.line(800, 500, 700, 600)

            love.graphics.line(100, 0, 0, 100)
            love.graphics.line(700, 0, 800, 100)
            love.graphics.setLineWidth(1)
        end
        if state == tie then
            love.graphics.setColor(1, 1, 0, 1)
        elseif state == xw then
            love.graphics.setColor(0, 1, 0 ,1)
        elseif state == ow then
            love.graphics.setColor(1, 0, 0 ,1)
        end
        love.graphics.rectangle("line", 0, 0, 800, 600)

        love.graphics.rectangle("fill", cx*100, cy*100, 10,10) -- shows curser

    elseif scene == "select type" then
        love.graphics.setFont(bigfont)
        love.graphics.print("tic tac lua", 150, 50)

        love.graphics.setFont(midfont)

        love.graphics.rectangle("line", 200, 250, 400, 100)
        love.graphics.print("singleplayer", 240, 270)

        love.graphics.rectangle("line", 200, 350, 200, 100)
        love.graphics.print("host", 240, 370)

        love.graphics.rectangle("line", 400, 350, 200, 100)
        love.graphics.print("client", 430, 370)
    elseif scene == "client" then

    elseif scene == "host" then
        love.graphics.setFont(midfont)
        love.graphics.rectangle("line", 200, 200, 400, 100)
        love.graphics.print(textbox .. "_", 200, 200)
    endend