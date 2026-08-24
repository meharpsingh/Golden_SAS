/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__devsascom-rest-api-samples/DataManagement/catalog/python/catalog/create-and-use-asset/create-and-use-asset.ipynb (ipynb 0) */

url = sasserver + "/catalog/definitions"

payload = json.dumps({"definitionType": "entity",
                      "description": "Public Data Set",
                      "id": "3eb3719a-2c62-4889-b66e-abe6cb24c7a8",
                      "name": "publicDataSet",
                      "platformTypeName": "publicDataSet",
                      "label": "Public Data Set",
                      "version": 2,
                      "baseType": "asset",
                      "metaCategory": "PRIMARY",
                      "attributeDefinitions": {
                          "externalLink": {
                              "description": "External URL of the resource",
                              "name": "externalLink",
                              "label": "Resource Link",
                              "type": "string"
                          },
                          "usabilityRating": {
                              "name": "usabilityRating",
                              "label": "Usability Rating",
                              "type": "number"
                          },
                          "keywords": {
                              "name": "keywords",
                              "label": "Keywords",
                              "description": "Terms used to search and describe the data set.",
                              "type": "string"
                          },
                          "license": {
                              "name": "license",
                              "label": "license",
                              "type": "string"
                          }
                      }
                     })
headers = {
  'Content-Type': 'application/vnd.sas.metadata.definition.entity+json;version=2',
  'Accept': 'application/vnd.sas.metadata.definition.entity+json;version=2',
  'Authorization': 'Bearer ' + access_token
}

response = requests.request("POST", url, headers=headers, data=payload, verify=False);

response = response.json()
print(json.dumps(response, indent=2))
type_definition_id = response["id"]
type_definition_name = response["name"]
run;
