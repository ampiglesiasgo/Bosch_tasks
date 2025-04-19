with cte as
( select  
c.vtweg     as distribution_channel,
c.vkorg      as sales_organization,
c.budat     as billing_doc_date,
c.kaufn     as sales_document, 
c. vkgrp     as sales_group,
c.artnr       as material_id,
m.maktx   as material_text,
k.kunnr     as customer_no,
k.nam1     as customer_name,
sum(VVR03) as Quantity,
sum(VVR05+VVR09-VVR10-VVR11-VVR12-VVR13+VVR14-VVR17+VVR06+VVR07+VVR19+VVR21+VVR22+VVR23+VVR24) as TGS,
sum(VVR05+VVR09-VVR10-VVR11-VVR12-VVR13+VVR14-VVR17+VVR06+VVR07+VVR19+VVR21+VVR22+VVR23+VVR24-VVR25-VVR32-VVRX1) as TNS
from hcdap_prod.bronze_dds.mart_pricingtool_vw_ce15611_d0 c
 left join hcdap_prod.bronze_sapptt.makt m    on ARTNR = MATNR and SPRAS = 'E'
 left join hcdap_prod.bronze_sapptt.kna1 k on c.kndnr = k.kunnr
where  c.PALEDGER = 01  and c.vkorg = '0022' and c.VTWEG in ('A0', 'A4') and c.BUDAT = '20241001' 
group by all );

select * from cte
unpivot include nulls (payload for KPI_values in ( Quantity,TGS , TNS ));
