<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="add-product-wrapper">
    <div class="add-product-box">

        <h2>Add Product</h2>

        <form action="/amz.com/saveProduct"
              method="post"
              enctype="multipart/form-data">

            <label>Product Name</label>
            <input type="text" name="product_name" required>

            <label>Quantity</label>
            <input type="number" name="qty" required>

            <label>Price</label>
            <input type="number" step="0.01" name="price" required>

            <label>Category</label>
            <input type="text" name="categroy" required>

            <label>Product Image</label>
            <input type="file" name="productImage" accept="image/*" required>

            <button type="submit">Add Product</button>

        </form>

    </div>
</div>

<jsp:include page="footer.jsp" />
