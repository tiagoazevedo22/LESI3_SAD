/*
 Navicat Premium Data Transfer

 Source Server         : SAD_IPCA_PostGres
 Source Server Type    : PostgreSQL
 Source Server Version : 120007 (120007)
 Source Host           : postgres2.ipca.pt:5432
 Source Catalog        : wwi
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120007 (120007)
 File Encoding         : 65001

 Date: 04/04/2023 18:52:54
*/


-- ----------------------------
-- Table structure for buyinggroups
-- ----------------------------
DROP TABLE IF EXISTS "public"."buyinggroups";
CREATE TABLE "public"."buyinggroups" (
  "buyinggroupid" int4 NOT NULL,
  "buyinggroupname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS "public"."cities";
CREATE TABLE "public"."cities" (
  "cityid" int4 NOT NULL,
  "cityname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "stateprovinceid" int4 NOT NULL,
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "latestrecordedpopulation" int8
)
;

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS "public"."colors";
CREATE TABLE "public"."colors" (
  "colorid" int4 NOT NULL,
  "colorname" varchar(20) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS "public"."countries";
CREATE TABLE "public"."countries" (
  "countryid" int4 NOT NULL,
  "ountryname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "formalname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "isoalpha3code" varchar(3) COLLATE "pg_catalog"."default",
  "latestrecordedpopulation" int8,
  "continent" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "region" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "subregion" varchar(30) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for customercategories
-- ----------------------------
DROP TABLE IF EXISTS "public"."customercategories";
CREATE TABLE "public"."customercategories" (
  "customercategoryid" int4 NOT NULL,
  "customercategoryname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS "public"."customers";
CREATE TABLE "public"."customers" (
  "customerid" int4 NOT NULL,
  "customername" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "billtocustomerid" int4 NOT NULL,
  "customercategoryid" int4 NOT NULL,
  "buyinggroupid" int4,
  "primarycontactpersonid" int4 NOT NULL,
  "alternatecontactpersonid" int4,
  "deliverymethodid" int4 NOT NULL,
  "deliverycityid" int4 NOT NULL,
  "postalcityid" int4 NOT NULL,
  "creditlimit" numeric(18,2),
  "accountopeneddate" date NOT NULL,
  "standarddiscountpercentage" numeric(18,3) NOT NULL,
  "isstatementsent" int2 NOT NULL,
  "isoncredithold" int2 NOT NULL,
  "paymentdays" int4 NOT NULL,
  "phonenumber" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "faxnumber" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "deliveryrun" varchar(5) COLLATE "pg_catalog"."default",
  "runposition" varchar(5) COLLATE "pg_catalog"."default",
  "websiteurl" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "deliveryaddressline1" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "deliveryaddressline2" varchar(60) COLLATE "pg_catalog"."default",
  "deliverypostalcode" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "deliverylocation" varchar(255) COLLATE "pg_catalog"."default",
  "postaladdressline1" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "postaladdressline2" varchar(60) COLLATE "pg_catalog"."default",
  "postalpostalcode" varchar(10) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for customertransactions
-- ----------------------------
DROP TABLE IF EXISTS "public"."customertransactions";
CREATE TABLE "public"."customertransactions" (
  "customertransactionid" int4 NOT NULL,
  "customerid" int4 NOT NULL,
  "transactiontypeid" int4 NOT NULL,
  "invoiceid" int4,
  "paymentmethodid" int4,
  "transactiondate" date NOT NULL,
  "amountexcludingtax" numeric(18,2) NOT NULL,
  "taxamount" numeric(18,2) NOT NULL,
  "transactionamount" numeric(18,2) NOT NULL,
  "outstandingbalance" numeric(18,2) NOT NULL,
  "finalizationdate" date,
  "isfinalized" int2
)
;

-- ----------------------------
-- Table structure for deliverymethods
-- ----------------------------
DROP TABLE IF EXISTS "public"."deliverymethods";
CREATE TABLE "public"."deliverymethods" (
  "deliverymethodid" int4 NOT NULL,
  "deliverymethodname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for invoicelines
-- ----------------------------
DROP TABLE IF EXISTS "public"."invoicelines";
CREATE TABLE "public"."invoicelines" (
  "invoicelineid" int4 NOT NULL,
  "invoiceid" int4 NOT NULL,
  "stockitemid" int4 NOT NULL,
  "description" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "packagetypeid" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "unitprice" numeric(18,2),
  "taxrate" numeric(18,3) NOT NULL,
  "taxamount" numeric(18,2) NOT NULL,
  "lineprofit" numeric(18,2) NOT NULL,
  "extendedprice" numeric(18,2) NOT NULL
)
;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS "public"."invoices";
CREATE TABLE "public"."invoices" (
  "invoiceid" int4 NOT NULL,
  "customerid" int4 NOT NULL,
  "billtocustomerid" int4 NOT NULL,
  "orderid" int4,
  "deliverymethodid" int4 NOT NULL,
  "contactpersonid" int4 NOT NULL,
  "accountspersonid" int4 NOT NULL,
  "salespersonpersonid" int4 NOT NULL,
  "packedbypersonid" int4 NOT NULL,
  "invoicedate" date NOT NULL,
  "customerpurchaseordernumber" varchar(20) COLLATE "pg_catalog"."default",
  "iscreditnote" int2 NOT NULL,
  "creditnotereason" text COLLATE "pg_catalog"."default",
  "comments" text COLLATE "pg_catalog"."default",
  "deliveryinstructions" text COLLATE "pg_catalog"."default",
  "internalcomments" text COLLATE "pg_catalog"."default",
  "totaldryitems" int4 NOT NULL,
  "totalchilleritems" int4 NOT NULL,
  "deliveryrun" varchar(5) COLLATE "pg_catalog"."default",
  "runposition" varchar(5) COLLATE "pg_catalog"."default",
  "returneddeliverydata" text COLLATE "pg_catalog"."default",
  "confirmeddeliverytime" timestamp(6),
  "confirmedreceivedby" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for orderlines
-- ----------------------------
DROP TABLE IF EXISTS "public"."orderlines";
CREATE TABLE "public"."orderlines" (
  "orderlineid" int4 NOT NULL,
  "orderid" int4 NOT NULL,
  "stockitemid" int4 NOT NULL,
  "description" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "packagetypeid" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "unitprice" numeric(18,2),
  "taxrate" numeric(18,3) NOT NULL,
  "pickedquantity" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
  "orderid" int4 NOT NULL,
  "customerid" int4 NOT NULL,
  "salespersonpersonid" int4 NOT NULL,
  "pickedbypersonid" int4,
  "contactpersonid" int4 NOT NULL,
  "backorderorderid" int4,
  "orderdate" date NOT NULL,
  "expecteddeliverydate" date NOT NULL,
  "customerpurchaseordernumber" varchar(20) COLLATE "pg_catalog"."default",
  "isundersupplybackordered" int2 NOT NULL,
  "comments" text COLLATE "pg_catalog"."default",
  "deliveryinstructions" text COLLATE "pg_catalog"."default",
  "internalcomments" text COLLATE "pg_catalog"."default",
  "pickingcompletedwhen" timestamp(6)
)
;

-- ----------------------------
-- Table structure for packagetypes
-- ----------------------------
DROP TABLE IF EXISTS "public"."packagetypes";
CREATE TABLE "public"."packagetypes" (
  "packagetypeid" int4 NOT NULL,
  "packagetypename" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for paymentmethods
-- ----------------------------
DROP TABLE IF EXISTS "public"."paymentmethods";
CREATE TABLE "public"."paymentmethods" (
  "paymentmethodid" int4 NOT NULL,
  "paymentmethodname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS "public"."people";
CREATE TABLE "public"."people" (
  "personid" int4 NOT NULL,
  "fullname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "preferredname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "searchname" text COLLATE "pg_catalog"."default" NOT NULL,
  "ispermittedtologon" int2 NOT NULL,
  "logonname" varchar(50) COLLATE "pg_catalog"."default",
  "isexternallogonprovider" int2 NOT NULL,
  "hashedpassword" bytea,
  "issystemuser" int2 NOT NULL,
  "isemployee" int2 NOT NULL,
  "issalesperson" int2 NOT NULL,
  "userpreferences" text COLLATE "pg_catalog"."default",
  "phonenumber" varchar(20) COLLATE "pg_catalog"."default",
  "faxnumber" varchar(20) COLLATE "pg_catalog"."default",
  "emailaddress" varchar(256) COLLATE "pg_catalog"."default",
  "photo" bytea,
  "customfields" text COLLATE "pg_catalog"."default",
  "otherlanguages" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for specialdeals
-- ----------------------------
DROP TABLE IF EXISTS "public"."specialdeals";
CREATE TABLE "public"."specialdeals" (
  "specialdealid" int4 NOT NULL,
  "stockitemid" int4,
  "customerid" int4,
  "buyinggroupid" int4,
  "customercategoryid" int4,
  "stockgroupid" int4,
  "dealdescription" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "startdate" date NOT NULL,
  "enddate" date NOT NULL,
  "discountamount" numeric(18,2),
  "discountpercentage" numeric(18,3),
  "unitprice" numeric(18,2)
)
;

-- ----------------------------
-- Table structure for stateprovinces
-- ----------------------------
DROP TABLE IF EXISTS "public"."stateprovinces";
CREATE TABLE "public"."stateprovinces" (
  "stateprovinceid" int4 NOT NULL,
  "stateprovincecode" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "stateprovincename" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "countryid" int4 NOT NULL,
  "salesterritory" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "latestrecordedpopulation" int8
)
;

-- ----------------------------
-- Table structure for stockgroups
-- ----------------------------
DROP TABLE IF EXISTS "public"."stockgroups";
CREATE TABLE "public"."stockgroups" (
  "stockgroupid" int4 NOT NULL,
  "stockgroupname" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for stockitems
-- ----------------------------
DROP TABLE IF EXISTS "public"."stockitems";
CREATE TABLE "public"."stockitems" (
  "stockitemid" int4 NOT NULL,
  "stockitemname" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "supplierid" int4 NOT NULL,
  "colorid" int4,
  "unitpackageid" int4 NOT NULL,
  "outerpackageid" int4 NOT NULL,
  "brand" varchar(50) COLLATE "pg_catalog"."default",
  "size" varchar(20) COLLATE "pg_catalog"."default",
  "leadtimedays" int4 NOT NULL,
  "quantityperouter" int4 NOT NULL,
  "ischillerstock" int2 NOT NULL,
  "barcode" varchar(50) COLLATE "pg_catalog"."default",
  "taxrate" numeric(18,3) NOT NULL,
  "unitprice" numeric(18,2) NOT NULL,
  "recommendedretailprice" numeric(18,2),
  "typicalweightperunit" numeric(18,3) NOT NULL,
  "marketingcomments" text COLLATE "pg_catalog"."default",
  "internalcomments" text COLLATE "pg_catalog"."default",
  "photo" bytea,
  "customfields" text COLLATE "pg_catalog"."default",
  "tags" text COLLATE "pg_catalog"."default",
  "searchdetails" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for transactiontypes
-- ----------------------------
DROP TABLE IF EXISTS "public"."transactiontypes";
CREATE TABLE "public"."transactiontypes" (
  "transactiontypeid" int4 NOT NULL,
  "transactiontypename" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Primary Key structure for table buyinggroups
-- ----------------------------
ALTER TABLE "public"."buyinggroups" ADD CONSTRAINT "pk_sales_buyinggroups" PRIMARY KEY ("buyinggroupid");

-- ----------------------------
-- Indexes structure for table cities
-- ----------------------------
CREATE INDEX "fk_application_cities_stateprovinceid" ON "public"."cities" USING btree (
  "stateprovinceid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cities
-- ----------------------------
ALTER TABLE "public"."cities" ADD CONSTRAINT "pk_application_cities" PRIMARY KEY ("cityid");

-- ----------------------------
-- Primary Key structure for table colors
-- ----------------------------
ALTER TABLE "public"."colors" ADD CONSTRAINT "pk_warehouse_colors" PRIMARY KEY ("colorid");

-- ----------------------------
-- Primary Key structure for table countries
-- ----------------------------
ALTER TABLE "public"."countries" ADD CONSTRAINT "countries_pkey" PRIMARY KEY ("countryid");

-- ----------------------------
-- Primary Key structure for table customercategories
-- ----------------------------
ALTER TABLE "public"."customercategories" ADD CONSTRAINT "pk_sales_customercategories" PRIMARY KEY ("customercategoryid");

-- ----------------------------
-- Indexes structure for table customers
-- ----------------------------
CREATE INDEX "fk_sales_customers_alternatecontactpersonid" ON "public"."customers" USING btree (
  "alternatecontactpersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customers_buyinggroupid" ON "public"."customers" USING btree (
  "buyinggroupid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customers_customercategoryid" ON "public"."customers" USING btree (
  "customercategoryid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customers_deliverycityid" ON "public"."customers" USING btree (
  "deliverycityid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customers_deliverymethodid" ON "public"."customers" USING btree (
  "deliverymethodid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customers_postalcityid" ON "public"."customers" USING btree (
  "postalcityid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customers_primarycontactpersonid" ON "public"."customers" USING btree (
  "primarycontactpersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sales_customers_perf_20160301_06" ON "public"."customers" USING btree (
  "isoncredithold" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "customerid" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "billtocustomerid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table customers
-- ----------------------------
ALTER TABLE "public"."customers" ADD CONSTRAINT "pk_sales_customers" PRIMARY KEY ("customerid");

-- ----------------------------
-- Indexes structure for table customertransactions
-- ----------------------------
CREATE INDEX "cx_sales_customertransactions" ON "public"."customertransactions" USING btree (
  "transactiondate" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customertransactions_customerid" ON "public"."customertransactions" USING btree (
  "transactiondate" "pg_catalog"."date_ops" ASC NULLS LAST,
  "customerid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customertransactions_invoiceid" ON "public"."customertransactions" USING btree (
  "transactiondate" "pg_catalog"."date_ops" ASC NULLS LAST,
  "invoiceid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customertransactions_paymentmethodid" ON "public"."customertransactions" USING btree (
  "transactiondate" "pg_catalog"."date_ops" ASC NULLS LAST,
  "paymentmethodid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_customertransactions_transactiontypeid" ON "public"."customertransactions" USING btree (
  "transactiondate" "pg_catalog"."date_ops" ASC NULLS LAST,
  "transactiontypeid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sales_customertransactions_isfinalized" ON "public"."customertransactions" USING btree (
  "transactiondate" "pg_catalog"."date_ops" ASC NULLS LAST,
  "isfinalized" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table customertransactions
-- ----------------------------
ALTER TABLE "public"."customertransactions" ADD CONSTRAINT "pk_sales_customertransactions" PRIMARY KEY ("customertransactionid");

-- ----------------------------
-- Primary Key structure for table deliverymethods
-- ----------------------------
ALTER TABLE "public"."deliverymethods" ADD CONSTRAINT "pk_application_deliverymethods" PRIMARY KEY ("deliverymethodid");

-- ----------------------------
-- Indexes structure for table invoicelines
-- ----------------------------
CREATE INDEX "fk_sales_invoicelines_invoiceid" ON "public"."invoicelines" USING btree (
  "invoiceid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoicelines_packagetypeid" ON "public"."invoicelines" USING btree (
  "packagetypeid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoicelines_stockitemid" ON "public"."invoicelines" USING btree (
  "stockitemid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table invoicelines
-- ----------------------------
ALTER TABLE "public"."invoicelines" ADD CONSTRAINT "pk_sales_invoicelines" PRIMARY KEY ("invoicelineid");

-- ----------------------------
-- Indexes structure for table invoices
-- ----------------------------
CREATE INDEX "fk_sales_invoices_accountspersonid" ON "public"."invoices" USING btree (
  "accountspersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoices_billtocustomerid" ON "public"."invoices" USING btree (
  "billtocustomerid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoices_contactpersonid" ON "public"."invoices" USING btree (
  "contactpersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoices_customerid" ON "public"."invoices" USING btree (
  "customerid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoices_deliverymethodid" ON "public"."invoices" USING btree (
  "deliverymethodid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoices_orderid" ON "public"."invoices" USING btree (
  "orderid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoices_packedbypersonid" ON "public"."invoices" USING btree (
  "packedbypersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_invoices_salespersonpersonid" ON "public"."invoices" USING btree (
  "salespersonpersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sales_invoices_confirmeddeliverytime" ON "public"."invoices" USING btree (
  "confirmeddeliverytime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table invoices
-- ----------------------------
ALTER TABLE "public"."invoices" ADD CONSTRAINT "pk_sales_invoices" PRIMARY KEY ("invoiceid");

-- ----------------------------
-- Indexes structure for table orderlines
-- ----------------------------
CREATE INDEX "fk_sales_orderlines_orderid" ON "public"."orderlines" USING btree (
  "orderid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_orderlines_packagetypeid" ON "public"."orderlines" USING btree (
  "packagetypeid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sales_orderlines_allocatedstockitems" ON "public"."orderlines" USING btree (
  "stockitemid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table orderlines
-- ----------------------------
ALTER TABLE "public"."orderlines" ADD CONSTRAINT "pk_sales_orderlines" PRIMARY KEY ("orderlineid");

-- ----------------------------
-- Indexes structure for table orders
-- ----------------------------
CREATE INDEX "fk_sales_orders_contactpersonid" ON "public"."orders" USING btree (
  "contactpersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_orders_customerid" ON "public"."orders" USING btree (
  "customerid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_orders_pickedbypersonid" ON "public"."orders" USING btree (
  "pickedbypersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_orders_salespersonpersonid" ON "public"."orders" USING btree (
  "salespersonpersonid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "pk_sales_orders" PRIMARY KEY ("orderid");

-- ----------------------------
-- Primary Key structure for table packagetypes
-- ----------------------------
ALTER TABLE "public"."packagetypes" ADD CONSTRAINT "pk_warehouse_packagetypes" PRIMARY KEY ("packagetypeid");

-- ----------------------------
-- Primary Key structure for table paymentmethods
-- ----------------------------
ALTER TABLE "public"."paymentmethods" ADD CONSTRAINT "pk_application_paymentmethods" PRIMARY KEY ("paymentmethodid");

-- ----------------------------
-- Indexes structure for table people
-- ----------------------------
CREATE INDEX "ix_application_people_fullname" ON "public"."people" USING btree (
  "fullname" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_application_people_isemployee" ON "public"."people" USING btree (
  "isemployee" "pg_catalog"."int2_ops" ASC NULLS LAST
);
CREATE INDEX "ix_application_people_issalesperson" ON "public"."people" USING btree (
  "issalesperson" "pg_catalog"."int2_ops" ASC NULLS LAST
);
CREATE INDEX "ix_application_people_perf_20160301_05" ON "public"."people" USING btree (
  "ispermittedtologon" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "personid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table people
-- ----------------------------
ALTER TABLE "public"."people" ADD CONSTRAINT "pk_application_people" PRIMARY KEY ("personid");

-- ----------------------------
-- Indexes structure for table specialdeals
-- ----------------------------
CREATE INDEX "fk_sales_specialdeals_buyinggroupid" ON "public"."specialdeals" USING btree (
  "buyinggroupid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_specialdeals_customercategoryid" ON "public"."specialdeals" USING btree (
  "customercategoryid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_specialdeals_customerid" ON "public"."specialdeals" USING btree (
  "customerid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_specialdeals_stockgroupid" ON "public"."specialdeals" USING btree (
  "stockgroupid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sales_specialdeals_stockitemid" ON "public"."specialdeals" USING btree (
  "stockitemid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table specialdeals
-- ----------------------------
ALTER TABLE "public"."specialdeals" ADD CONSTRAINT "pk_sales_specialdeals" PRIMARY KEY ("specialdealid");

-- ----------------------------
-- Primary Key structure for table stateprovinces
-- ----------------------------
ALTER TABLE "public"."stateprovinces" ADD CONSTRAINT "stateprovinces_pkey" PRIMARY KEY ("stateprovinceid");

-- ----------------------------
-- Primary Key structure for table stockgroups
-- ----------------------------
ALTER TABLE "public"."stockgroups" ADD CONSTRAINT "pk_warehouse_stockgroups" PRIMARY KEY ("stockgroupid");

-- ----------------------------
-- Indexes structure for table stockitems
-- ----------------------------
CREATE INDEX "fk_warehouse_stockitems_colorid" ON "public"."stockitems" USING btree (
  "colorid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_warehouse_stockitems_outerpackageid" ON "public"."stockitems" USING btree (
  "outerpackageid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_warehouse_stockitems_supplierid" ON "public"."stockitems" USING btree (
  "supplierid" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_warehouse_stockitems_unitpackageid" ON "public"."stockitems" USING btree (
  "unitpackageid" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table stockitems
-- ----------------------------
ALTER TABLE "public"."stockitems" ADD CONSTRAINT "pk_warehouse_stockitems" PRIMARY KEY ("stockitemid");

-- ----------------------------
-- Primary Key structure for table transactiontypes
-- ----------------------------
ALTER TABLE "public"."transactiontypes" ADD CONSTRAINT "pk_application_transactiontypes" PRIMARY KEY ("transactiontypeid");

-- ----------------------------
-- Foreign Keys structure for table cities
-- ----------------------------
ALTER TABLE "public"."cities" ADD CONSTRAINT "fk_cities_stateprovinceid_stateprovinces" FOREIGN KEY ("stateprovinceid") REFERENCES "public"."stateprovinces" ("stateprovinceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customers
-- ----------------------------
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_customers_alternatecontactpersonid_people" FOREIGN KEY ("alternatecontactpersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_customers_deliverycityid_cities" FOREIGN KEY ("deliverycityid") REFERENCES "public"."cities" ("cityid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_customers_deliverymethodid_deliverymethods" FOREIGN KEY ("deliverymethodid") REFERENCES "public"."deliverymethods" ("deliverymethodid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_customers_postalcityid_cities" FOREIGN KEY ("postalcityid") REFERENCES "public"."cities" ("cityid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_customers_primarycontactpersonid_people" FOREIGN KEY ("primarycontactpersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_sales_customers_billtocustomerid_sales_customers" FOREIGN KEY ("billtocustomerid") REFERENCES "public"."customers" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_sales_customers_buyinggroupid_sales_buyinggroups" FOREIGN KEY ("buyinggroupid") REFERENCES "public"."buyinggroups" ("buyinggroupid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customers" ADD CONSTRAINT "fk_sales_customers_customercategoryid_sales_customercategories" FOREIGN KEY ("customercategoryid") REFERENCES "public"."customercategories" ("customercategoryid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customertransactions
-- ----------------------------
ALTER TABLE "public"."customertransactions" ADD CONSTRAINT "fk_customertransactions_paymentmethodid_paymentmethods" FOREIGN KEY ("paymentmethodid") REFERENCES "public"."paymentmethods" ("paymentmethodid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customertransactions" ADD CONSTRAINT "fk_customertransactions_transactiontypeid_transactiontypes" FOREIGN KEY ("transactiontypeid") REFERENCES "public"."transactiontypes" ("transactiontypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customertransactions" ADD CONSTRAINT "fk_sales_customertransactions_customerid_sales_customers" FOREIGN KEY ("customerid") REFERENCES "public"."customers" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."customertransactions" ADD CONSTRAINT "fk_sales_customertransactions_invoiceid_sales_invoices" FOREIGN KEY ("invoiceid") REFERENCES "public"."invoices" ("invoiceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table invoicelines
-- ----------------------------
ALTER TABLE "public"."invoicelines" ADD CONSTRAINT "fk_invoicelines_packagetypeid_packagetypes" FOREIGN KEY ("packagetypeid") REFERENCES "public"."packagetypes" ("packagetypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoicelines" ADD CONSTRAINT "fk_invoicelines_stockitemid_stockitems" FOREIGN KEY ("stockitemid") REFERENCES "public"."stockitems" ("stockitemid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoicelines" ADD CONSTRAINT "fk_sales_invoicelines_invoiceid_sales_invoices" FOREIGN KEY ("invoiceid") REFERENCES "public"."invoices" ("invoiceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table invoices
-- ----------------------------
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_invoices_accountspersonid_people" FOREIGN KEY ("accountspersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_invoices_contactpersonid_people" FOREIGN KEY ("contactpersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_invoices_deliverymethodid_deliverymethods" FOREIGN KEY ("deliverymethodid") REFERENCES "public"."deliverymethods" ("deliverymethodid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_invoices_packedbypersonid_people" FOREIGN KEY ("packedbypersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_invoices_salespersonpersonid_people" FOREIGN KEY ("salespersonpersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_sales_invoices_billtocustomerid_sales_customers" FOREIGN KEY ("billtocustomerid") REFERENCES "public"."customers" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_sales_invoices_customerid_sales_customers" FOREIGN KEY ("customerid") REFERENCES "public"."customers" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."invoices" ADD CONSTRAINT "fk_sales_invoices_orderid_sales_orders" FOREIGN KEY ("orderid") REFERENCES "public"."orders" ("orderid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table orderlines
-- ----------------------------
ALTER TABLE "public"."orderlines" ADD CONSTRAINT "fk_orderlines_packagetypeid_packagetypes" FOREIGN KEY ("packagetypeid") REFERENCES "public"."packagetypes" ("packagetypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orderlines" ADD CONSTRAINT "fk_orderlines_stockitemid_stockitems" FOREIGN KEY ("stockitemid") REFERENCES "public"."stockitems" ("stockitemid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orderlines" ADD CONSTRAINT "fk_sales_orderlines_orderid_sales_orders" FOREIGN KEY ("orderid") REFERENCES "public"."orders" ("orderid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_orders_contactpersonid_people" FOREIGN KEY ("contactpersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_orders_pickedbypersonid_people" FOREIGN KEY ("pickedbypersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_orders_salespersonpersonid_people" FOREIGN KEY ("salespersonpersonid") REFERENCES "public"."people" ("personid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_sales_orders_backorderorderid_sales_orders" FOREIGN KEY ("backorderorderid") REFERENCES "public"."orders" ("orderid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD CONSTRAINT "fk_sales_orders_customerid_sales_customers" FOREIGN KEY ("customerid") REFERENCES "public"."customers" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table specialdeals
-- ----------------------------
ALTER TABLE "public"."specialdeals" ADD CONSTRAINT "fk_sales_specialdeals_buyinggroupid_sales_buyinggroups" FOREIGN KEY ("buyinggroupid") REFERENCES "public"."buyinggroups" ("buyinggroupid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."specialdeals" ADD CONSTRAINT "fk_sales_specialdeals_customercategoryid_sales_customercategori" FOREIGN KEY ("customercategoryid") REFERENCES "public"."customercategories" ("customercategoryid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."specialdeals" ADD CONSTRAINT "fk_sales_specialdeals_customerid_sales_customers" FOREIGN KEY ("customerid") REFERENCES "public"."customers" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."specialdeals" ADD CONSTRAINT "fk_specialdeals_stockgroupid_stockgroups" FOREIGN KEY ("stockgroupid") REFERENCES "public"."stockgroups" ("stockgroupid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."specialdeals" ADD CONSTRAINT "fk_specialdeals_stockitemid_stockitems" FOREIGN KEY ("stockitemid") REFERENCES "public"."stockitems" ("stockitemid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table stateprovinces
-- ----------------------------
ALTER TABLE "public"."stateprovinces" ADD CONSTRAINT "fk_stateprovinces_contryid_countries" FOREIGN KEY ("countryid") REFERENCES "public"."countries" ("countryid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table stockitems
-- ----------------------------
ALTER TABLE "public"."stockitems" ADD CONSTRAINT "fk_stockitems_colorid_countries" FOREIGN KEY ("colorid") REFERENCES "public"."colors" ("colorid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."stockitems" ADD CONSTRAINT "fk_stockitems_packagetypes_" FOREIGN KEY ("unitpackageid") REFERENCES "public"."packagetypes" ("packagetypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
