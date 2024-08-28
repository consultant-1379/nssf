Feature: Configured NSSAI is not answered because request already includes the requestedNssai 

Scenario: REQUESTED_NSSAI_IN_REQUEST
   Given target type is NSSF_HTTP
   Given target tag is NSSF
   Given path is /nnssf-nsselection/v1/network-slice-information?nf-type=AMF&nf-id=amf-initial&slice-info-request-for-registration=%7B%22subscribedNssai%22%3A%5B%7B%22subscribedSnssai%22%3A%7B%22sst%22%3A1%2C%22sd%22%3A%22000001%22%7D%2C%22defaultIndication%22%3Afalse%7D%2C%7B%22subscribedSnssai%22%3A%7B%22sst%22%3A1%2C%22sd%22%3A%22000002%22%7D%2C%22defaultIndication%22%3Atrue%7D%5D%2C%22requestedNssai%22%3A%5B%7B%22sst%22%3A1%2C%22sd%22%3A%22000001%22%7D%2C%7B%22sst%22%3A1%2C%22sd%22%3A%22000002%22%7D%5D%7D&tai=%7B%22plmnId%22%3A%7B%22mcc%22%3A%22460%22%2C%22mnc%22%3A%2200%22%7D%2C%22tac%22%3A%22000112%22%7D&home-plmn-id=%7B%22mcc%22%3A%22460%22%2C%22mnc%22%3A%2200%22%7D
   When we send GET request
   Then we expect response status code 200
   Then we expect response time less than 1100 milliseconds
