Config = {}

Config.InsideOptions = {
    [1] = {
        name = "Tent 1",
        enterPos = vector3(449.281, 2251.627, 249.059),--position of enter prompt
        enterSpawn = vector3(446.985, 2253.675, 249.428),--where to spawn player after enter prompt used
        exitPos = false,--can leave tents by walking through the wall, wall has collision bugs
        exitSpawn = false,--if its a tent with buggy wall, turn false. Otherwise add vector3 position to spawn as exit
        job = {"wapiti","wapiti2"},--jobs to enter, or false for no job
        blip = {enable = false, sprite = 0},
    },
    [2] = {
        name = "Tent 2",
        enterPos = vector3(461.279, 2259.022, 249.108),
        enterSpawn = vector3(462.260, 2260.419, 249.116),
        exitPos = false,--can leave tents by walking through the wall, wall has collision bugs
        exitSpawn = false,--if its a tent with buggy wall, turn false. Otherwise add vector3 position to spawn as exit
        job = {"wapiti","wapiti2"},--jobs to enter, or false for no job
        blip = {enable = false, sprite = 0},
    },
    [3] = {
        name = "Denis Storage",
        enterPos = vector3(2545.719, -1499.084, 46.965),
        enterSpawn = vector3(2546.004, -1510.248, 47.089),
        exitPos = vector3(2546.004, -1510.248, 47.089),--if has no issues with wall, add a position where players can reach the exit prompt
        exitSpawn = vector3(2545.719, -1499.084, 46.965),--if has no issues with wall, add vector3 position to spawn as exit
        job = {"smuggler","smuggler2"},--jobs to enter, or false for no job
        blip = {enable = true, sprite = 0},
    },
    [4] = {
        name = "Denis Storage 2",
        enterPos = vector3(2627.963, -1493.224, 45.970),
        enterSpawn = vector3(2629.555, -1493.477, 46.136),
        exitPos = vector3(2629.555, -1493.477, 46.136),--if has no issues with wall, add a position where players can reach the exit prompt
        exitSpawn = vector3(2627.963, -1493.224, 45.970),--if has no issues with wall, add vector3 position to spawn as exit
        job = {"smuggler","smuggler2"},--jobs to enter, or false for no job
        blip = {enable = true, sprite = 0},
    },
    [5] = {
        name = "Denis Wagon 1",
        enterPos = vector3(2442.335, -1480.083, 46.877),
        enterSpawn = vector3(2440.618, -1480.144, 46.971),
        exitPos = vector3(2440.618, -1480.144, 46.971),--if has no issues with wall, add a position where players can reach the exit prompt
        exitSpawn = vector3(2442.335, -1480.083, 46.877),--if has no issues with wall, add vector3 position to spawn as exit
        job = {"smuggler","smuggler2"},--jobs to enter, or false for no job
        blip = {enable = true, sprite = 0},
    },
    [6] = {
        name = "Denis Storage 3",
        enterPos = vector3(2376.772, -1492.481, 46.023),
        enterSpawn = vector3(2373.734, -1492.438, 45.991),
        exitPos = vector3(2373.734, -1492.438, 45.991),--if has no issues with wall, add a position where players can reach the exit prompt
        exitSpawn = vector3(2376.772, -1492.481, 46.023),--if has no issues with wall, add vector3 position to spawn as exit
        job = {"smuggler","smuggler2"},--jobs to enter, or false for no job
        blip = {enable = true, sprite = 0},
    },
    [7] = {
        name = "Tent 3",
        enterPos = vector3(472.393, 2268.072, 249.166),
        enterSpawn = vector3(470.937, 2269.250, 249.194),
        exitPos = false,--can leave tents by walking through the wall, wall has collision bugs
        exitSpawn = false,--if its a tent with buggy wall, turn false. Otherwise add vector3 position to spawn as exit
        job = {"wapiti","wapiti2"},--jobs to enter, or false for no job
        blip = {enable = false, sprite = 0},
    },
}

