using Dapper;
using Microsoft.AspNetCore.Mvc;
using ProiectFinalAPI.Models;
using System.Data;
using System.Data.SqlClient;

namespace ProiectFinalAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FileController : Controller
    {
        private readonly SqlConnection _connection;
        public FileController(SqlConnection connection)
        {
            _connection = connection;
        }

        [Route("InsertDocument")]
        [HttpPost]
        public IActionResult InsertDocument([FromBody] DocumentTypeModel document)
        {
            var parameters = new {document.DocumentName };

            _connection.Open();
            _connection.Execute("Insert_Document", parameters, commandType: CommandType.StoredProcedure);
            _connection.Close();

            return Ok(new { Message = "Document inserted successfully!" });
        }
        [Route("InsertFile")]
        [HttpPost]
        public IActionResult InsertFile([FromBody] FileModel file)
        {
            var parameters = new { file.WholeCaseNumber, file.Name, file.DocumentId };

            _connection.Open();
            _connection.Execute("Insert_File", parameters, commandType: CommandType.StoredProcedure);
            _connection.Close();

            return Ok(new { Message = "File inserted successfully!" });
        }
        [Route("GetAllFiles")]
        [HttpGet]
        public IActionResult GetAllFiles()
        {
            _connection.Open();
            var fileList = _connection.Query("Get_AllFiles", commandType: CommandType.StoredProcedure).ToList();        
            _connection.Close();

            return Ok(fileList);
        }
        
        [Route("GetAllDocuments")]
        [HttpGet]
        public IActionResult GetAllDocuments()
        {
            _connection.Open();
            var documentList = _connection.Query("GetAllDocuments", commandType: CommandType.StoredProcedure).ToList();
            _connection.Close();

            return Ok(documentList);
        }
        [Route("GetFileByDocumentType/{id}")]
        [HttpGet]
        public IActionResult GetFileByDocumentType(int id)
        {
            var parameters = new { Id = id };
            _connection.Open();
            var fileList = _connection.Query("Get_FileByDocumentType", parameters, commandType: CommandType.StoredProcedure).ToList();
            _connection.Close();

            return Ok(fileList);
        }
    }

}
