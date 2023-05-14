player1_y = 60
player2_y = 60
ball_x = 120
ball_y = 68
ball_dx = 2
ball_dy = 2
paddle_height = 20

function TIC()
    -- player 1 controls
    if btn(2) then player1_y = player1_y - 2 end
    if btn(3) then player1_y = player1_y + 2 end

    -- player 2 controls
    if btn(0, 1) then player2_y = player2_y - 2 end
    if btn(1, 1) then player2_y = player2_y + 2 end

    -- update ball position
    ball_x = ball_x + ball_dx
    ball_y = ball_y + ball_dy

    -- bounce ball off top and bottom
    if ball_y < 0 or ball_y > 136 then ball_dy = -ball_dy end

    -- bounce ball off paddles
    if ball_dx < 0 and math.abs(ball_y - player1_y) < paddle_height / 2 and ball_x < 10 then
        ball_dx = -ball_dx
    elseif ball_dx > 0 and math.abs(ball_y - player2_y) < paddle_height / 2 and ball_x > 230 then
        ball_dx = -ball_dx
    end

    -- reset ball if it goes off screen
    if ball_x < 0 or ball_x > 240 then
        ball_x = 120
        ball_y = 68
    end

    cls(0)
    -- draw paddles
    rect(5, player1_y - paddle_height / 2, 7, player1_y + paddle_height / 2, 15)
    rect(233, player2_y - paddle_height / 2, 235, player2_y + paddle_height / 2, 15)
    -- draw ball
    circ(ball_x, ball_y, 2, 15)
end
