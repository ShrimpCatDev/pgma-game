return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 12,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 9,
  nextobjectid = 12,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "tileset.png",
      imagewidth = 256,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 256,
      tiles = {
        {
          id = 21,
          properties = {
            ["collidable"] = true,
            ["jumpthru"] = true,
            ["platform"] = true
          }
        },
        {
          id = 22,
          properties = {
            ["collidable"] = true,
            ["jumpthru"] = true,
            ["platform"] = true
          }
        },
        {
          id = 23,
          properties = {
            ["collidable"] = true,
            ["jumpthru"] = true,
            ["platform"] = true
          }
        },
        {
          id = 24,
          properties = {
            ["collidable"] = true,
            ["jumpthru"] = true,
            ["platform"] = true
          }
        },
        {
          id = 25,
          properties = {
            ["collidable"] = true,
            ["jumpthru"] = true,
            ["platform"] = true
          }
        },
        {
          id = 26,
          properties = {
            ["collidable"] = true,
            ["jumpthru"] = true,
            ["platform"] = true
          }
        },
        {
          id = 64,
          animation = {
            {
              tileid = 64,
              duration = 100
            },
            {
              tileid = 65,
              duration = 100
            },
            {
              tileid = 66,
              duration = 100
            },
            {
              tileid = 67,
              duration = 100
            },
            {
              tileid = 68,
              duration = 100
            },
            {
              tileid = 69,
              duration = 100
            },
            {
              tileid = 70,
              duration = 100
            },
            {
              tileid = 71,
              duration = 100
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../bg/stars.png",
      id = 8,
      name = "parralax3",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.1,
      parallaxy = 0,
      repeatx = true,
      repeaty = false,
      properties = {}
    },
    {
      type = "imagelayer",
      image = "../bg/cloud2.png",
      id = 6,
      name = "parralax2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.25,
      parallaxy = 0.1,
      repeatx = true,
      repeaty = false,
      properties = {}
    },
    {
      type = "imagelayer",
      image = "../bg/cloud1.png",
      id = 5,
      name = "parralax",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.5,
      parallaxy = 0.12,
      repeatx = true,
      repeaty = false,
      properties = {}
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      id = 3,
      name = "bg",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      id = 1,
      name = "terrain",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        22, 23, 23, 23, 23, 39, 55, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        38, 39, 39, 39, 39, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        54, 55, 55, 55, 55, 56, 0, 0, 22, 24, 0, 0, 0, 0, 25, 26, 26, 26, 27, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 38, 40, 0, 0, 0, 0, 41, 42, 42, 42, 43, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 54, 56, 0, 0, 0, 0, 41, 42, 42, 42, 43, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 42, 42, 42, 43, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 22, 23, 23, 23, 24,
        0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57, 54, 55, 55, 55, 56,
        1, 3, 3, 3, 2, 2, 4, 3, 3, 4, 4, 3, 3, 4, 4, 2, 3, 4, 2, 5,
        17, 19, 18, 19, 20, 19, 19, 19, 18, 18, 20, 20, 18, 20, 19, 18, 18, 18, 19, 21,
        33, 36, 36, 34, 35, 36, 34, 35, 34, 34, 35, 36, 34, 35, 36, 34, 35, 35, 34, 37,
        49, 51, 52, 50, 50, 51, 51, 51, 52, 52, 50, 51, 52, 50, 51, 52, 52, 50, 50, 53
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      id = 2,
      name = "deco",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 4,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 34, 36,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {
        ["collidable"] = true
      },
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 128,
          width = 320,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["platform"] = true
          }
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 64,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["jumpthru"] = true,
            ["platform"] = true
          }
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 96,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {
            ["platform"] = true
          }
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 0,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["platform"] = true
          }
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 32,
          width = 32,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {
            ["platform"] = true
          }
        }
      }
    }
  }
}
