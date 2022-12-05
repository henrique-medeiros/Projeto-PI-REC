var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/ultimas2/:idAtm", function (req, res) {
    medidaController.buscarMedidaIdle(req, res);
})

router.get("/tempo-real-atm/:fkAtm", function (req, res) {
    medidaController.buscarMedidasTempoRealporAtm(req, res);
});

router.get("/atm/:fkAtm", function (req, res) {
    medidaController.buscarMedidaAtm(req, res);
})
router.get("/toniniFofo", function (req, res) {
    medidaController.toniniFofo(req, res);
})


module.exports = router;