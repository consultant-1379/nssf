Feature: NSSF Provision

Scenario: Provision Nrf instance profile in NSSF
  Given target type is NSSF_HTTP
  Given target tag is PROV
  Given path is /nssf-provisioning/v1/profiles/nrf-instance-profiles/nrf-slice-coomon-region-001
  Given request header is Content-Type:application/json
  Given request content is
  """
{
  "nrfInstanceName" : "nrf-slice-common-region-001",
  "nrfInstanceInfoList" : [ {
    "adminState" : "UNLOCKED",
    "nrfInstanceId" : "11a1de11-ec45-4cd6-a842-ce5bb3cba3d8",
    "nrfId" : "http://nrfa842.nrf.5gc.mnc000.mcc460.3gppnetwork.org/nnrf-disc/v1/",
    "nrfNfMgtUri" : "http://nrfa842.nrf.5gc.mnc000.mcc460.3gppnetwork.org/nnrf-nfm/v1/",
    "nrfAccessTokenUri" : "http://nrfa842.nrf.5gc.mnc000.mcc460.3gppnetwork.org/oauth2/v1/"
  } ]
}
  """
  When we send PUT request
  Then we expect response status code 201
  Then we expect response status code 204
  Then we expect response time less than 1100 milliseconds

Scenario: Provision Nsi profile in NSSF
  Given target type is NSSF_HTTP
  Given target tag is PROV
  Given path is /nssf-provisioning/v1/profiles/network-slice-instances/nsi-slice-common-region-001
  Given request header is Content-Type:application/json
  Given request content is
  """
{
  "sliceInstanceName" : "nsi-slice-common-region-001",
  "nsiId" : "nsi-common-slice-common-region-001",
  "nrfProfileName" : "nrf-slice-common-region-001"
}
  """
  When we send PUT request
  Then we expect response status code 201
  Then we expect response status code 204
  Then we expect response time less than 1100 milliseconds



Scenario: Provision Amf Set profile in NSSF
  Given target type is NSSF_HTTP
  Given target tag is PROV
  Given path is /nssf-provisioning/v1/profiles/amf-set-profiles/amf-set-id/460-00-01-001
  Given request header is Content-Type:application/json
  Given request content is
    """
{
  "amfSetName" : "AmfSetId-001",
  "amfSetAdminState" : "UNLOCKED",
  "amfSetId" : "460-00-01-001",
  "servedPlmnIds" : [ {
    "mcc" : "460",
    "mnc" : "00"
  }, {
    "mcc" : "460",
    "mnc" : "01"
  } ],
  "nrfProfileName" : "nrf-slice-common-region-001"
}
    """
  When we send PUT request
  Then we expect response status code 201
  Then we expect response status code 204
  Then we expect response time less than 1100 milliseconds

Scenario: Provision Tai Group Nss profile in NSSF
  Given target type is NSSF_HTTP
  Given target tag is PROV
  Given path is /nssf-provisioning/v1/profiles/tai-group-nss-profiles/tai-group-slice1-amf-001
  Given request header is Content-Type:application/json
  Given request content is
    """
{
  "profileName" : "tai-group-slice1-amf-001",
  "amfSetId" : "460-00-01-001",
  "taiGroupInfo" : {
    "tacRangeList" : [ {
      "start" : "000100",
      "end" : "000113"
    }, {
      "start" : "000114",
      "end" : "000127"
    }, {
      "start" : "000128",
      "end" : "00013b"
    }, {
      "start" : "00013c",
      "end" : "00014f"
    }, {
      "start" : "000150",
      "end" : "000163"
    } ],
    "servedPlmnIds" : [ {
      "mcc" : "460",
      "mnc" : "00"
    }, {
      "mcc" : "460",
      "mnc" : "01"
    } ],
    "supportedSnssaiInfo" : {
      "nsiProfileName" : "nsi-slice-common-region-001",
      "sNssai" : {
        "sst" : 1,
        "sd" : "000002"
      }
    },
    "nssPolicies" : [ {
      "policyEnabled" : false,
      "policyUsage" : "ue-registration"
    } ]
  }
}
    """
  When we send PUT request
  Then we expect response status code 201
  Then we expect response status code 204
  Then we expect response time less than 1100 milliseconds
