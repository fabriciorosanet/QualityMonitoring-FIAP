using Moq;
using Xunit;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using monitoramento_ambiental_mongodb.Controllers;
using monitoramento_ambiental_mongodb.Models;
using monitoramento_ambiental_mongodb.Services;

namespace monitoramento_ambiental_mongodb.Tests
{
    public class AlertaControllerTests
    {
        private readonly Mock<AlertaService> _alertaServiceMock;
        private readonly AlertaController _alertaController;

        public AlertaControllerTests()
        {
            // Inicializa o mock do serviço
            _alertaServiceMock = new Mock<AlertaService>();

            // Cria uma instância da controller passando o serviço mockado
            _alertaController = new AlertaController(_alertaServiceMock.Object);
        }

        [Fact]
        public async Task GetAlertas_ReturnsOk_WithListOfAlertas()
        {
            // Arrange
            var mockAlertas = new List<AlertaModel> { new AlertaModel { Id = "1", Descricao = "Alerta 1" } };
            _alertaServiceMock.Setup(service => service.GetAsync()).ReturnsAsync(mockAlertas);

            // Act
            var result = await _alertaController.GetAlertas();

            // Assert
            var okResult = Assert.IsType<OkObjectResult>(result.Result);
            var returnAlertas = Assert.IsType<List<AlertaModel>>(okResult.Value);
            Assert.Single(returnAlertas);
        }
    }
}