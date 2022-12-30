CREATE TABLE TH_OBJECT_HEADER (
  OID       VARCHAR(32) PRIMARY KEY,
  CLASS_OID VARCHAR(32) NOT NULL,
  FLAGS     VARCHAR(32)
);

---------------------------------------------------------------
-- BASIC OBJECTS
---------------------------------------------------------------
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('c349c34970ad0d00a0df7c0b0fbdbb13', '54e8a45c70ad0d00a0e0cf4a0fbdbb13', 0);  -- nil with class UndefinedObject
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('9605c19970ad0d00a0e8cb220fbdbb13', '3f459e9d70ad0d00a0ebe6710fbdbb13', 0);  -- true with class True
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('504d0d9c70ad0d00a0e94f5d0fbdbb13', 'a7adaca070ad0d00a0ed4b840fbdbb13', 0);  -- false with class False
---------------------------------------------------------------
-- BASIC CLASSES
---------------------------------------------------------------

-- Object
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('dbc5266d70ad0d00a0e26a4e0fbdbb13', 'd07edf6d70ad0d00a0e3449f0fbdbb13', 0);  -- Object with Object class
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('d07edf6d70ad0d00a0e3449f0fbdbb13', 'b4cacf7870ad0d00a0e509060fbdbb13', 0);  -- Object class with Metaclass

-- Undefined Object
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('54e8a45c70ad0d00a0e0cf4a0fbdbb13', '023c896870ad0d00a0e1282c0fbdbb13', 0);  -- UndefinedObject with UndefinedObject class
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('023c896870ad0d00a0e1282c0fbdbb13', 'b4cacf7870ad0d00a0e509060fbdbb13', 0);  -- UndefinedObject class with Metaclass

-- Boolean
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('9f782a9470ad0d00a0e67d680fbdbb13', 'cfdb0a9570ad0d00a0e75bd80fbdbb13', 0);  -- Boolean with Boolean class
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('cfdb0a9570ad0d00a0e75bd80fbdbb13', 'b4cacf7870ad0d00a0e509060fbdbb13', 0);  -- Boolean class with Metaclass

-- True
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('3f459e9d70ad0d00a0ebe6710fbdbb13', '91bc859e70ad0d00a0ec29a50fbdbb13', 0);  -- True with True class
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('91bc859e70ad0d00a0ec29a50fbdbb13', 'b4cacf7870ad0d00a0e509060fbdbb13', 0);  -- True class with Metaclass

-- False
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('a7adaca070ad0d00a0ed4b840fbdbb13', '022ab0a270ad0d00a0ee02920fbdbb13', 0);  -- False with False class
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('022ab0a270ad0d00a0ee02920fbdbb13', 'b4cacf7870ad0d00a0e509060fbdbb13', 0);  -- False class with Metaclass

-- Behavior
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('16b2a7c570ad0d00a0f187db0fbdbb13', 'bffc36c670ad0d00a0f254930fbdbb13', 0);  -- Behavior with Behavior class
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('bffc36c670ad0d00a0f254930fbdbb13', 'b4cacf7870ad0d00a0e509060fbdbb13', 0);  -- Behavior class with Metaclass

-- ClassDescription
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('c4f00dca70ad0d00a0f3bcf70fbdbb13', '90ba85ca70ad0d00a0f423990fbdbb13', 0);  -- ClassDescription with ClassDescription class
INSERT INTO TH_OBJECT_HEADER (OID, CLASS_OID, FLAGS) VALUES ('90ba85ca70ad0d00a0f423990fbdbb13', 'b4cacf7870ad0d00a0e509060fbdbb13', 0);  -- ClassDescription class with Metaclass
