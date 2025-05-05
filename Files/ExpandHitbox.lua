for _, v in ipairs(plrs) do
    if v.Character:FindFirstChild("Hitbox") or v.Character:FindFirstChild("HitBox") then
        print("Hitbox found")
    else
        print("Hitbox not found")
    end
end