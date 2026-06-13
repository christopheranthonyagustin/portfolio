using System.Net.Http;
using Newtonsoft.Json;

namespace ShopifyLarkTracker.Services
{
    public class LarkSchemaService
    {
        private readonly HttpClient _httpClient;
        private Dictionary<string, string> _nameToFieldId;
        private bool _loaded = false;

        public LarkSchemaService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task EnsureLoadedAsync()
        {
            if (_loaded) return;

            var json = await _httpClient.GetStringAsync("YOUR_LARK_FIELDS_ENDPOINT");
            var response = JsonConvert.DeserializeObject<LarkFieldResponse>(json);

            _nameToFieldId = new Dictionary<string, string>();

            foreach (var item in response.data.items)
            {
                var fieldId = item.field_id;
                var fieldName = item.field_name;

                // store both raw + trimmed
                _nameToFieldId[fieldName.Trim()] = fieldId;
            }

            _loaded = true;
        }

        public string GetFieldId(string name)
        {
            if (_nameToFieldId.TryGetValue(name, out var id))
                return id;

            throw new Exception($"Missing Lark field mapping: {name}");
        }

        public class LarkFieldResponse
        {
            public int code { get; set; }
            public LarkFieldData data { get; set; }
            public string msg { get; set; }
        }

        public class LarkFieldData
        {
            public List<LarkFieldItem> items { get; set; }
        }

        public class LarkFieldItem
        {
            public string field_id { get; set; }
            public string field_name { get; set; }
            public string type { get; set; }
        }
    }
}
