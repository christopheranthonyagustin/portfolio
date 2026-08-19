export interface ShopifyLineItem {

  id: number;

  variantId: number | null;

  title: string;

  sku: string;

  quantity: number;

  variantTitle: string;

  grams: number;

  requiresShipping: boolean;

  weight: number;

  weightUnit: string;

  length: number;

  width: number;

  height: number;

}
