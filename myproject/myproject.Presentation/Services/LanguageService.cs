using System.Globalization;
using System.Reflection;
using Microsoft.Extensions.Localization;
using Microsoft.VisualBasic;
using Newtonsoft.Json;

namespace myproject.Presentation.Services
{
    public class LanguageService
    {
        private readonly IStringLocalizer _localizer;
        private readonly string _filePath = Path.Combine(Directory.GetCurrentDirectory(), "Resources", "localization.json");
        private Dictionary<string, Dictionary<string, string>> _localizationData;

        public class SharedResource()
        {

        }

        public LanguageService()
        {
            // JSON dosyasını oku ve veriyi deseralize et
            var json = File.ReadAllText(_filePath);
            _localizationData = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, string>>>(json);
        }

        public string GetKey(string key)
        {
            var culture = GetCulture();
            if (_localizationData.ContainsKey(key))
            {
                if (_localizationData[key].ContainsKey(culture))
                {
                    return _localizationData[key][culture];
                }
                else
                {
                    Console.WriteLine("Culture not found for key: " + key);
                }
            }
            else
            {
                Console.WriteLine("Key not found: " + key);
            }
            return key;
        }

        public string GetCulture(){
            var culture = CultureInfo.CurrentCulture;
            return culture.Name;

        }
    }
}