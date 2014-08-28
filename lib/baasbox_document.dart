part of baasbox;

class BaasBoxDocument {
  Map data;
  String collection;
  String id;
  String author;
  String creation_date;
  String rid;
  double version;


  Future create(String collection, Map dataInDocument) {

    Future ftr;

    BaasBoxContext bbCtxt = new BaasBoxContext();

    ftr = bbCtxt.rest("POST", '/document/' + collection, true, dataInDocument);

    ftr.then((documentCreated) { 
      data = documentCreated['data'];
      id = data['id'];
    });
    
    return ftr;
  }

  Future<Map> retrieve(String documentId, String collection) {

    Future ftr;

    BaasBoxContext bbCtxt = new BaasBoxContext();

    ftr = bbCtxt.rest("GET", '/document/' + collection + '/' + documentId, true);
    return ftr;
  }

  Future modify(String documentId, String collection, Map data) {

    Future ftr;

    BaasBoxContext bbCtxt = new BaasBoxContext();

    ftr = bbCtxt.rest("PUT", '/document/' + collection + '/' + documentId, true, data);
    return ftr;
  }

  Future delete(String collection) {

    Future ftr;

    BaasBoxContext bbCtxt = new BaasBoxContext();

    ftr = bbCtxt.rest("DELETE", '/document/' + collection + '/' + id, true);
    return ftr;
  }

  Future<Map> count(String collection) {

    Future ftr;

    BaasBoxContext bbCtxt = new BaasBoxContext();

    ftr = bbCtxt.rest("GET", '/document/' + collection + '/count', true);
    return ftr;
  }

  Future<Map> updateField(String fieldName, String documentId, String collection, Map dataToEdit) {

    Future ftr;

    BaasBoxContext bbCtxt = new BaasBoxContext();

    ftr = bbCtxt.rest("PUT", '/document/$collection/$documentId/.$fieldName', true, dataToEdit);
    return ftr;
  }

}
