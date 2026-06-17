using { ProcurementService } from '../../srv/procurement-service';
 
annotate ProcurementService.Products with @UI: {
 
    SelectionFields: [
        productName,
        unitPrice,
        stock,
        isActive
    ],
 
    LineItem: [
        { Value: productName, Label: 'Product' },
        { Value: unitPrice, Label: 'Price' },
        { Value: stock, Label: 'Stock', Criticality: stockCriticality },
        { Value: isActive, Label: 'Active' }
    ],
 
    HeaderInfo: {
        TypeName: 'Product',
        TypeNamePlural: 'Products',
        Title: { Value: productName },
        Description: { Value: description }
    },
 
    HeaderFacets: [
        { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Price' },
        { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Stock' }
    ],
 
    DataPoint#Price: {
        Value: unitPrice,
        Title: 'Price'
    },
 
    DataPoint#Stock: {
        Value: stock,
        Title: 'Stock',
        Criticality: stockCriticality
    },
 
    Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#GeneralInfo',
            Label: 'General Information'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#StockInfo',
            Label: 'Stock Information'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#AdminInfo',
            Label: 'Administration'
        }
    ],
 
    FieldGroup#GeneralInfo: {
        Data: [
            { Value: productName, Label: 'Product Name' },
            { Value: description, Label: 'Description' },
            { Value: supplier_ID, Label: 'Supplier ID' }
        ]
    },
 
    FieldGroup#StockInfo: {
        Data: [
            { Value: unitPrice, Label: 'Price' },
            { Value: stock, Label: 'Current Stock' },
            { Value: minStock, Label: 'Minimum Stock' },
            { Value: unit, Label: 'Unit' },
            { Value: isActive, Label: 'Active' }
        ]
    },
 
    FieldGroup#AdminInfo: {
        Data: [
            { Value: createdAt, Label: 'Created On' },
            { Value: createdBy, Label: 'Created By' },
            { Value: modifiedAt, Label: 'Modified On' },
            { Value: modifiedBy, Label: 'Modified By' }
        ]
    }
};