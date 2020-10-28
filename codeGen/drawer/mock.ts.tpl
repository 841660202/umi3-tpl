export default {
  // 支持值为 Object 和 Array
  "GET /api/%={apiPath}=%/list": {
    "returnCode": "000000",
    "data": {
      "total": 10,
      "list": [
         {  id:0,
          %=#attributes=%
            %=key=%:"%=annotation=%", //%=annotation=%
          %=/attributes=%
         },
         {
            id:1,
          %=#attributes=%
            %=key=%:"%=annotation=%", //%=annotation=%
          %=/attributes=%
         },
         {
            id:2,
          %=#attributes=%
            %=key=%:"%=annotation=%", //%=annotation=%
          %=/attributes=%
         },
      ],
    },
  },
  "GET /api/%={apiPath}=%/getDetail": {
    "returnCode": "000000",
    "data": {
      %=#attributes=%
        %=key=%:"%=annotation=%", //%=annotation=%
      %=/attributes=%
    },
  },
  "POST /api/%={apiPath}=%/save": {
      "returnCode": "000000",
      "data": true,
  },
  "POST /api/%={apiPath}=%/delete": {
      "returnCode": "000000",
      "data": true,
  },
  "GET /api/%={apiPath}=%/statistic": {
      "returnCode": "000000",
      "data": {
            
      }
  },
};