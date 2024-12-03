using System;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using myproject.Business.Abstract;
using myproject.Entities;
using myproject.Presentation.Identity;
using myproject.Presentation.Models;

namespace myproject.Presentation.Controllers
{
    [Authorize]
    public class CartController:Controller
    {
        private ICartService _cartService;
        private UserManager<User> _userManager;
        public CartController(ICartService cartService,UserManager<User> userManager)
        {
            _cartService = cartService;
            _userManager = userManager;
        }
        // CartModel model = new CartModel();

        public IActionResult Index()
        {
            var cart = _cartService.GetCartByUserId(_userManager.GetUserId(User));
            // model.CartId = 0;
            return View(new CartModel(){
                CartId = cart.Id,
                CartItems = cart.CartItems.Select(i=>new CartItemModel(){
                    CartItemId = i.Id,
                    ProductId = i.ProductId,
                    Name = i.Product.Name,
                    Price = i.Product.Price.Value,
                    Quantity = i.Quantity
                }).ToList()
            });
        } 

        [HttpPost]
        public IActionResult AddToCart(int productId,int quantity)
        {
            var userId = _userManager.GetUserId(User);
            _cartService.AddToCart(userId,productId,quantity);
            return RedirectToAction("Index");
        } 

        [HttpPost]
        public IActionResult DeleteFromCart(int productId)
        {
             var userId = _userManager.GetUserId(User);
            _cartService.DeleteFromCart(userId,productId);
            return RedirectToAction("Index");
        }

        public IActionResult checkout(){
            var cart = _cartService.GetCartByUserId(_userManager.GetUserId(User));
            var orderModel = new OrderModel();
            orderModel.CartModel = new CartModel(){
                CartId = cart.Id,
                CartItems = cart.CartItems.Select(i=>new CartItemModel(){
                    CartItemId = i.Id,
                    ProductId = i.ProductId,
                    Name = i.Product.Name,
                    Price = i.Product.Price.Value,
                    Quantity = i.Quantity
                }).ToList()
            };

            return View(orderModel);
        }
    }
}