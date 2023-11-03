class Medicine {
   int? id;
   String commercialName;
   double price;
   int stockQty;
   String drugName;
   String manufacturingDate;
   String manufacturerName;

   Medicine.withId(
       this.id,
       this.commercialName,
       this.price,
       this.stockQty,
       this.drugName,
       this.manufacturingDate,
       this.manufacturerName,
       );

   Medicine.withoutId(
       this.commercialName,
       this.price,
       this.stockQty,
       this.drugName,
       this.manufacturingDate,
       this.manufacturerName,
       );

   Map<String, dynamic> toJson() {
      return {
         'commercialName': commercialName,
         'price': price,
         'stockQty': stockQty,
         'drugName': drugName,
         'manufacturingDate': manufacturingDate,
         'manufacturerName': manufacturerName,
      };
   }

}
