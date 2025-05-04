+++
title = 'SQL slower query log : 1'
date = 2025-04-01T20:02:09+13:00
draft = false
tags = ["SQL", "SlowerQuery"]
description = ""
+++


## Query1 - NOT solve
```
SELECT a.*, b.name AS stateName, b.nameZh AS stateNameZh, c.partNo, c.aliasName AS componentAliasName,       c.spec AS componentSpec, c.colour AS componentColour, c.componentTypeId, c.businessTypeId, c.modelNo,        d.name AS componentTypeName, d.nameZh AS componentTypeNameZh, d.customerNo AS componentTypeNo,       f.name AS unitTypeName, f.nameZh AS unitTypeNameZh, g.orderNo AS parentOrderNo,       h.customerNo AS planCustomerNo, h.orderLineNumber AS planOrderLineNumber, h.planNo, h.extendDesc AS planDesc, h.amount, h.unitPrice, h.currencyId,       j.grossAmount, j.unmetAmount, k.demandId, l.userName AS qcCheckerNameZh, m.nameZh AS currencyNameZh       FROM companyExWarehouseOrderItem AS a, companyExWarehouseOrderState AS b, companyBasicComponent AS c, companyComponentType AS d,       companyBasicComponentBomUnitType AS f, companyExWarehouseOrder AS g, companyProductionSchedules AS h, companyProductionSchedulesBom AS j,      companyProductionDemandSchedule AS k, user AS l, currency AS m       WHERE a.parentId = 27682 AND a.sourceTypeId = 1 AND a.stateId = b.id AND a.componentId = c.id AND c.componentTypeId = d.id AND c.unitTypeId = f.id AND a.parentId = g.id AND a.scheduleId = h.id AND h.id = j.scheduleId       AND a.componentId = j.componentId AND a.scheduleId = k.scheduleId AND a.qcCheckerId = l.id AND h.currencyId = m.id;
```

before : 4.0291
code use in : solution.getSales().getTask().getExWarehouse().getItem().getListByParentId(mysqlCoon.getSlaveConn(), detailInfo.id, cb);

```
CREATE INDEX idx_exOrder_parent_source ON companyExWarehouseOrderItem (parentId, sourceTypeId);
```
then : 3.65







## Query 2

```
SELECT a.*, b.orderNo AS planNo, b.requireDate, b.requireDate AS planStartDate, f.aliasName, f.partNo, f.spec
FROM companyProductionSchedulesBom AS a, companyProductionDemandPurchaseRequirement AS b, companyBasicComponent AS f
WHERE a.companyId = 2 AND a.componentId = 917367 AND a.typeId = 0 AND a.sourceTypeId = 1 AND a.stateId = 0 AND a.unmetAmount > 0 AND a.requirementId = b.id AND b.componentId = f.id;
```
增加索引，并且顺序很重要:  
```
ALTER TABLE companyProductionSchedulesBom 
ADD INDEX idx_optimize_query (
    companyId, 
    componentId, 
    typeId, 
    sourceTypeId, 
    stateId
);
```

优化后:
**1.5 -> 0.0010**

## Query 3
```
# User@Host: etaSlave[etaSlave] @  [10.25.90.9] id: 20367468
# Query_time: 11  Lock_time: 0  Rows_sent: 0  Rows_examined: 573780
SET timestamp=1745708909
SELECT a.*, b.partNo, b.aliasName AS componentAliasName, b.spec AS componentSpec, b.componentTypeId, c.name AS componentTypeName, c.nameZh AS componentTypeNameZh, c.customerNo AS componentTypeNo, d.name AS productTypeName, d.nameZh AS productTypeNameZh, e.name AS stateName , e.nameZh AS stateNameZh,  f.name AS typeName, f.nameZh AS typeNameZh,       g.name AS basicTypeName, g.nameZh AS basicTypeNameZh, h.name AS unitTypeName, h.nameZh AS unitTypeNameZh, k.typeId AS storageBinTypeId, l.eName AS prepareUserName, l.userName AS prepareUserNameZh       FROM warehousingRecode AS a, companyBasicComponent AS b, companyComponentType AS c, warehousingRecodeProductType AS d , warehousingRecodeState AS e, materialRequirementType AS f, materialRequirementBasicType AS g, companyBasicComponentBomUnitType AS h,companyWarehouse AS j, warehouseStorageBinLevelTag AS k, user AS l        WHERE a.relationNo = 'DX-SP-2504190007' AND a.typeId = 2 AND a.componentId = b.id AND b.componentTypeId = c.id  AND a.productTypeId = d.id AND a.stateId = e.id AND a.typeId = f.id AND a.basicTypeId = g.id AND b.unitTypeId = h.id AND a.storageBinId != 0 AND a.storageBinId = j.id AND j.levelTagId = k.id AND a.prepareUserId = l.id;
```

```
CREATE INDEX idx_warehousingRecode_main ON warehousingRecode (relationNo, typeId, componentId, productTypeId, stateId, basicTypeId, storageBinId, prepareUserId);
```
优化后:
**1.5 -> 0.0010**

## Query 4  - NOT solve
```
# Query_time: 4  Lock_time: 0  Rows_sent: 1  Rows_examined: 367178
SET timestamp=1746316614
SELECT a.*, b.name AS stateName, b.nameZh AS stateNameZh, c.eName AS userName, c.userName AS userNameZh, d.name AS procedureName, d.nameZh AS procedureNameZh,     e.workshopId, e.name AS workCenterName, e.nameZh AS workCenterNameZh, f.eName AS workCenterManagerName, f.userName AS workCenterManagerNameZh,     h.planNo AS schedulePlanNo, h.requireDate AS scheduleRequireDate, h.netAmount, h.bomId, h.componentId, k.partNo, k.componentTypeId, k.aliasName AS componentAliasName, k.spec AS componentSpec,     l.customerNo AS componentTypeNo, l.nameZh AS componentTypeNameZh, l.name AS componentTypeName, m.procedureWagesTypeId, m.id AS componentProcedureId, m.estimateTimePrice, m.totalCost, m.cost, n.nameZh AS teamNameZh     FROM `companyProductionSchedulesTask` AS a, `companyProductionSchedulesTaskState` AS b, `user` AS c, meProcedure AS d, pmcWorkshopProductionLine AS e, user AS f,     companyProductionSchedules AS h, companyBasicComponent AS k, companyComponentType AS l, companyComponentTechnicProcedure AS m, companyWorkshopTeam AS n     WHERE a.companyId = 15  AND a.stateId = 0 AND a.id NOT IN (SELECT taskId FROM workshopByTimeWagesApply WHERE companyId = 15 AND id != 29745 ) AND a.stateId = b.id AND a.userId = c.id AND a.procedureId = d.id AND a.workCenterId = e.id AND a.workCenterManagerId = f.id AND e.workshopId = 16     AND a.schedulesId = h.id AND h.componentId = k.id AND k.componentTypeId = l.id AND a.procedureId = m.procedureId AND m.procedureWagesTypeId = 2 AND h.componentId = m.componentId AND a.teamId = n.id AND a.completeDate >= '2025-04-04' AND a.completeDate <= '2025-05-05';
```
before : 4.2

```
CREATE INDEX idx_apply_task_company_id ON workshopByTimeWagesApply(taskId, companyId, id);
```
then : 4.0
```
CREATE INDEX idx_task_filter ON companyProductionSchedulesTask(companyId, stateId, completeDate);
```
then : 3.6


### Query 5
```
# Query_time: 3  Lock_time: 0  Rows_sent: 0  Rows_examined: 5284489
SET timestamp=1746317175
SELECT a.*, b.name AS stateName, b.nameZh AS stateNameZh, c.partNo, c.aliasName AS componentAliasName, c.spec AS componentSpec, c.componentTypeId,   d.name AS componentTypeName, d.nameZh AS componentTypeNameZh, d.customerNo AS componentTypeNo, e.eName AS prepareUserName, e.userName AS prepareUserNameZh, f.name AS unitTypeName, f.nameZh AS unitTypeNameZh, f.integerTag AS unitTypeIntegerTag, g.orderNo AS parentOrderNo   FROM warehousingMaterialRequisitionItem AS a, warehousingMaterialRequisitionState AS b, companyBasicComponent AS c, companyComponentType AS d, user AS e, companyBasicComponentBomUnitType AS f, warehousingMaterialRequisition AS g   WHERE a.stateId = b.id AND a.componentId = c.id AND c.componentTypeId = d.id AND a.prepareUserId = e.id AND c.unitTypeId = f.id AND a.parentId = g.id AND g.relationId = 199743;
```
5.0273(3.2)
```
CREATE INDEX idx_relationId ON warehousingMaterialRequisition(relationId);
```
then : 0.0009
```
CREATE INDEX idx_parentId ON warehousingMaterialRequisitionItem(parentId);
```
then : 0.0006

