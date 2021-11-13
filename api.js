const {Pool} = require("pg");
const bodyParser = require("body-parser");
app.use(bodyParser.json());

const connection = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'cyf_ecommerce',
    password: 'Sohal123',
    port: 5432,
});

//
const api =() => {
const getAllCustomers = async (req, res) =>{
  try{
      const result = await connection.query("Select * from  customers" );
      await res.status(400).send(result.rows);
    }  catch(error){
       console.log(error)
    }
};

//
const getAllSupplier = async (req, res) =>{
  try{
      const result = await connection.query("Select * from  suppliers" );
      await res.status(400).send(result.rows);
    }  catch(error){
       console.log(error)
    }
};

//
 const getAllproducts = async(req, res) =>{
   try{
     const searchProduct = req.query.searchProduct;
     if(searchProduct){
       productQuery = await connection.query(
         `Select * from product where product_name LIKE '%${searchProduct}%'`
       );
       if(productQuery.rows.length >0){
         res.status(400).send("Product is not find");
       }
     }else{
       const result = await connection.query(`select * from products`);
       res.status(200).send(result.rows);
      }
   }catch(err){
     console.log(err);
   }
 };

//
const getCustomersById = async (req, res) => {
    const customerId = req.params.customerId;
    const newCustomerName = req.body.name;
    const newAddress = req.body.address;
    const newCity = req.body.city;
    const newCountry = req.body.country;
    await connection.query("SELECT * FROM customers WHERE id=$1",
    [newCustomerName, newAddress, newCity, newCountry, customerId]);
    return res.status(200).send(`CustomerId is: ${customerId}`);
  };

//
  const saveCustomer = async (req, res) => {
    const newCustomerName = req.body.name;
    const newAddress = req.body.address;
    const newCity = req.body.city;
    const newCountry = req.body.country;
    const result = await connection.query(
      "INSERT INTO customers (name, address, city, country) VALUES  ($1, $2, $3, $4) returning id",
      [newCustomerName, newAddress, newCity, newCountry]);
      const responseBody = { customerId: result.rows[0].id };
      return response.status(201).json(responseBody);
  };

//Check that the price is a positive integer and that the supplier ID exists in the database, otherwise return an error.
  
const getBadRequestProductResponse = () => {
  return {message: "Product is not exist",
          rules:["Supplier is exist and unit price is positive number"]}
}
const productIsCorrect = async (product) => {
  const result = await connection.query("select * from suppliers where id=$1", 
  [product.supplier_id]);
  return Number.isInteger(product.unit_price) && result.rows.length === 1 && product.unit_price > 0;
}
const addNewProduct = async (req, res) =>{
  const productBody = req.body;

  if(!await productIsCorrect(productBody)){
    return res.status(400).json(getBadRequestProductResponse());
  }
  
  const newProduct = `insert into products (product_name, unit_price, supplier_id)
  values ($1, $2, $3) returning id`;
  
  const result = await connection.query(newProduct, [
    productBody.product_name,
    productBody.unit_price,
    productBody.supplier_id
  ])
  const response = {productId: result.rows[0].id};
  return await res.json(response);
}
    
//
const updateCustomer = async (req, res) => {
    const customerId = req.params.customerId;
    const newCustomerName = req.body.name;
    const newAddress = req.body.address;
    const newCity = req.body.city;
    const newCountry = req.body.country;

   await connection.query("UPDATE customers SET name = $1, address = $2, city = $3, country = $4 WHERE id = $5",
   [newCustomerName, newAddress, newCity, newCountry, customerId]);
      return res.status(200).send(`User modified with ID: ${customerId}`);
};

// 
const deleteOrder = async (req, res) => {
  const orderId = req.params.orderId;

  await connection.query("DELETE FROM order_items  WHERE order_id=$1", [orderId]);
  return res.status(200).send(`orders ${orderId} deleted!`);
};


//
const deleteCustomer = async (req, res) => {
  const customerId = req.params.customerId;
 const customerOrder = await connection.query(
   `Select * from orders where customer_id = $1`, [customerId]);
  if(customerOrder > 0){
    return res.status(200).send(`customers ${customerId} has orders`);
  }
 await connection.query("DELETE FROM customers WHERE id=$1", [customerId])
        return res.status(400).send(`Customer ${customerId} deleted!`); 
};

  

return {
  getAllCustomers,
  getAllSupplier,
  getAllproducts,
  getCustomersById,
  saveCustomer,
  addNewProduct,
  updateCustomer,
  deleteOrder,
  deleteCustomer
};
};

module.exports = api;