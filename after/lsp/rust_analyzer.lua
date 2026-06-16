-- RUST_ANALYZER - RUST
return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },

      checkOnSave = true,

      lens = {
        enable = true,
        run = { enable = true },
        debug = { enable = true },
        implementations = { enable = true },
        references = {
          adt = { enable = true },
          enumVariant = { enable = true },
          method = { enable = true },
          trait = { enable = true },
        },
      },

      inlayHints = {
        bindingModeHints = { enable = true },
        chainingHints = { enable = true },
        closingBraceHints = { enable = true },
        closureReturnTypeHints = { enable = "always" },
        discriminantHints = { enable = "always" },
        expressionAdjustmentHints = { enable = "always" },
        lifetimeElisionHints = {
          enable = "always",
          useParameterNames = true,
        },
        parameterHints = { enable = true },
        reborrowHints = { enable = "always" },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    },
  },
}
