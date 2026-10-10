-- discord.gg/syncrypt

local function GetJobId()
    if hookmetamethod == nil or getexecutorname():lower() ~= "delta" then
        return game.JobId
    end
    local Captured = nil
    local OriginalIndex
    OriginalIndex = hookmetamethod(game, "__index", function(self, key)
        if Captured == nil and not checkcaller() then
            Captured = OriginalIndex(game, "JobId")
        end
        return OriginalIndex(self, key)
    end)
    repeat
        task.wait(0.1)
    until Captured ~= nil
    return Captured
end