function over_all_screens(c)
    c.floating = true
    local geo = screen[1].geometry
    geo.x2 = geo.x + geo.width
    geo.y2 = geo.y + geo.height
    for s in screen do
        local geo2 = s.geometry
        geo.x = math.min(geo.x, geo2.x)
        geo.y = math.min(geo.y, geo2.y)
        geo.x2 = math.max(geo.x2, geo2.x + geo2.width)
        geo.y2 = math.max(geo.y2, geo2.y + geo2.height)
    end
    c:geometry{
        x = geo.x,
        y = geo.y,
        width = geo.x2 - geo.x,
        height = geo.y2 - geo.y
    }
end
