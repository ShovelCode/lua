paddle_height = 20
ball_dx = 2
ball_dy = 2

function _init()
    player1_y = 64
    player2_y = 64
    ball_x = 64
    ball_y = 64
end

function _update()
    -- player 1 controls
    if btn(2) then player1_y -= 2 end
    if btn(3) then player1_y += 2 end

    -- player 2 controls
    if btn(0) then player2_y -= 2 end
    if btn(1) then player2_y += 2 end

    -- update ball position
    ball_x += ball_dx
    ball_y += ball_dy

    -- bounce ball off top and bottom
    if ball_y < 0 or ball_y > 128 then ball_dy *= -1 end

    -- bounce ball off paddles
    if ball_dx < 0 and abs(ball_y - player1_y) < paddle_height / 2 and ball_x < 8 then
        ball_dx *= -1
    elseif ball_dx > 0 and abs(ball_y - player2_y) < paddle_height / 2 and ball_x > 120 then
        ball_dx *= -1
    end

    -- reset ball if it goes off screen
    if ball_x < 0 or ball_x > 128 then
        ball_x = 64
        ball_y = 64
    end
end

function _draw()
    cls()
    -- draw paddles
    rectfill(0, player1_y - paddle_height / 2, 2, player1_y + paddle_height / 2, 7)
    rectfill(125, player2_y - paddle_height / 2, 127, player2_y + paddle_height / 2, 7)
    -- draw ball
    circfill(ball_x, ball_y, 2, 7)
end
