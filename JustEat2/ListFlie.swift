////
////  ListFlie.swift

//
//import SwiftUI
//struct AddItem1{
//    let id: Int
//    let name: String
//    let price: String
//    let type: String
//}
////let itemsAdded1 = AddItem(id: 0, name: "paratha", price: 50, type: "veg")
//
//
//struct ListFlie: View {
//    @Binding var name: String
//    @Binding var price: String
//    @Binding var type: String
//    init(name: Binding<String>, price: Binding<String>, type: Binding<String>){
//        self._name = name
//        self._price = price
//        self._type = type
//        
//}
//    @State private var count = 1
//    var body: some View {
//        
//        HStack{
//            VStack{
//                Text(itemsAdded.name)
//                Text(String(itemsAdded.price))
//                Text(itemsAdded.type)
//                
//            }.padding()
//            
//            Spacer()
//            VStack{
//                HStack{
//                    Divider().frame(height: 20)
//                    Button("-", action:{
//                        if count>=1{
//                            self.count -= 1
//                        }
//                    })
//                    Divider().frame(height: 20)
//                    Text("\(count)")
//                    Divider().frame(height: 20).border(Color.pink)
//                    Button("+",action: {
//                        self.count += 1
//                    })
//                    Divider().frame(height: 20)
//                    
//                }.overlay{RoundedRectangle(cornerRadius: 5,style: .continuous).stroke(.pink, lineWidth: 2)}
//                Text(String(itemsAdded1.price))
//                
//            }
//        }
////    }.frame(maxWidth: .infinity).background(Color("LightShade")).cornerRadius(15)
//    }
//}
//
//struct ListFlie_Previews: PreviewProvider {
//    static var previews: some View {
//        ListFlie(name: .constant(""), price: .constant(""), type: .constant(""))
//    }
//}





///


//import SwiftUI
//
//struct CartItemm: Identifiable {
//    let id = UUID()
//    var name: String
//    var veg: Bool
//    var price: Double
//    var quantity: String
//    var counter : Int
//    var totalPrice: Double
//}
//
//struct CartPage: View {
//    
//    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
//    @State private var showButtonDetails = false
////    For estimated time
//    @State private var estimatedDistance = 12
//    @Binding var tabSelected: Int
//    @State private var cartItems: [Cart] = []
////    Sample Data for list
//    @State private var items = [CartItemm(name: "Paratha", veg: true, price: 50.0, quantity: "[500 Ml]", counter: 1, totalPrice: 50.0),
//                                CartItemm(name: "chinese", veg: false, price: 120.0, quantity: "Noodles", counter: 1, totalPrice: 120.0)]
//    @State private var showRemoveAlert = false
//    @State private var currentCartItemId: UUID?
//    
//    
////    For bill summary
//    @State private var subTotalPrice = 230.45
//    @State private var gstPrice = 32.78
//    @State private var deliveryCharges = 75.30
//    @State private var grandTotalPrice = 278.08
//    
////    For bottom menu
//    @State private var currentPaymentWay = "Wallet"
//    @State private var currentPaymentImage = "menubar.dock.rectangle"
//    @State private var totalAmount = 278.08
//    
//    var body: some View {
//        ZStack {
//            Color("DarkShade")
//                .edgesIgnoringSafeArea(.top)
//           
//            if false {
//                VStack{
//                    Image(systemName: "cart.badge.questionmark")
//                        .resizable().scaledToFill().frame(width:50,height: 50)
//                    Text("oops your cart is empty!!")
//                }
//            }
//            else {
//                VStack {
//                    ScrollView { // For whole scrollable content
//                        VStack {
//                            HStack {
//                                Image(systemName: "stopwatch")
//                                    .foregroundColor(Color("DarkShade"))
//                                Text("Delivery in").fontWeight(.medium)
//                                Text(calculateTime(distance: estimatedDistance))
//                                    .fontWeight(.bold)
//                                Spacer()
//                            }
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(15)
//                            
//                            Group {
//                                HStack{
//                                    VStack(alignment: .leading){
//                                        Divider().frame(maxWidth: 80 )
//                                    }
//                                    //                    .frame(width:30,height: 5)
//                                    Text("ITEM(S) ADDED")
//                                        .tracking(1)
//                                        .padding()
//                                    VStack{
//                                        Divider().frame(maxWidth: 80 )
//                                    }
//                                }
//                                VStack { // Cart items
//                                    ForEach(cartItems) { item in
//                                        HStack {
//                                            VStack {
//                                                HStack {
//                                                    Image(systemName: "dot.square")
//                                                        .foregroundColor(item.isVeg! ? Color.green : Color.red)
//                                                    Text(item.name!)
//                                                        .fontWeight(.semibold)
//                                                        .font(.subheadline)
//                                                    Spacer()
//                                                }
//                                                HStack {
//                                                    Text("₹\(item.price!)")
//                                                        .fontWeight(.semibold)
//                                                        .font(.subheadline)
//                                                    Spacer()
//                                                }.padding(.leading, 25)
////                                                Text(item.quantity)
////                                                    .padding(.leading, 25)
////                                                    .frame(maxWidth: .infinity, alignment: .leading)
////                                                    .foregroundColor(Color.gray)
////                                                    .font(.caption)
//                                            }.padding(.trailing, 16)
//                                            VStack { // Custom stepper
//                                                
////                                                HStack {
////                                                    Button("-") {
////                                                        currentCartItemId = item.id
////                                                        item.counter == 1 ? showRemoveAlert = true : updateCartItems(id: item.id, inc: false)
////
////                                                    }.tint(Color("DarkShade"))
////
////                                                    Text(String(item.counter))
////                                                        .padding(.horizontal, 4)
////                                                    Button("+") {
////                                                        print(item.name)
////                                                        updateCartItems(id: item.id, inc: true)
////                                                    }.tint(Color("DarkShade"))
////                                                        .alert(isPresented: $showRemoveAlert) {
////                                                            Alert(
////                                                                title: Text("Are you sure you want to remove this item from the cart"),
////                                                                message: Text("There is no undo"),
////                                                                primaryButton: .destructive(Text("Remove")) {
////                                                                    deleteCartItem(id: currentCartItemId!)
////                                                                },
////                                                                secondaryButton: .cancel()
////                                                            )
////                                                        }
////
////                                                }.padding(.horizontal, 16).padding(.vertical, 2)
////                                                    .background(Color("LightShade"))
////                                                    .cornerRadius(5)
////                                                    .overlay (
////                                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
////                                                            .stroke(Color("DarkShade"), lineWidth: 2)
////                                                    )
//                                                
//                                                Text("₹\(item.price!)")
//                                                    .fontWeight(.semibold)
//                                                    .font(.subheadline)
//                                            }
//                                        }
//                                        .padding()
//                                    }
//                                }
//                                .background(Color.white)
//                                .cornerRadius(15)
//                                
//                                VStack {
//                                    HStack {
//                                        Image(systemName: "plus.circle")
//                                        Text("Add more items").font(.callout)
//                                        Spacer()
//                                        Button(action: {
//                                            
//                                        }, label: {
//                                            Image(systemName: "chevron.forward")
//                                                .foregroundColor(Color.gray)
//                                        })
//                                    }.onTapGesture(perform: {
//                                        tabSelected = 0
//                                    })
//                                    VStack{
//                                        Divider()
//                                    }
//                                    HStack {
//                                        Image(systemName: "square.and.pencil")
//                                        Text("Add cooking instructions").font(.callout)
//                                        Spacer()
//                                        Button(action: {
//                                            
//                                        }, label: {
//                                            Image(systemName: "chevron.forward")
//                                                .foregroundColor(Color.gray)
//                                        })
//                                    }
//                                }.padding()
//                                    .background(Color.white)
//                                    .cornerRadius(15)
//                            }
//                            // NA
//                            Group {
//                                //                            SectionHeader(heading: "BILL SUMMARY")
//                                HStack{
//                                    VStack(alignment: .leading){
//                                        Divider().frame(maxWidth: 80 )
//                                    }
//                                    //                    .frame(width:30,height: 5)
//                                    Text("BILL SUMMARY")
//                                        .tracking(1)
//                                        .padding()
//                                    VStack{
//                                        Divider().frame(maxWidth: 80 )
//                                    }
//                                }
//                                VStack {
//                                    HStack{
//                                        Text("Subtotal")
//                                        Spacer()
//                                        Text(String("₹\(String(Int(subTotalPrice)))"))
//                                    }.fontWeight(.bold)
//                                        .font(.system(size: 18))
//                                        .padding(8)
//                                    HStack{
//                                        Image(systemName: "building.columns")
//                                        Text("GST and restaurant charges")
//                                        Spacer()
//                                        Text(String("₹\(String(ceil(gstPrice)))"))
//                                    }.font(.system(size: 15)).padding(4)
//                                    HStack{
//                                        Image(systemName: "scooter")
//                                        Text("Delivery partner fee for 6km")
//                                        Spacer()
//                                        Text(String("₹\(String(deliveryCharges))"))
//                                    }.font(.system(size: 15)).padding(4)
//                                    Text("fully goes to them for their time and effort")
//                                        .fontWeight(.medium)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                        .font(.system(size: 13))
//                                        .foregroundColor(.gray).padding(.leading, 25)
//                                    HStack{
//                                        Button(action: {
//                                            showButtonDetails.toggle()
//                                        }, label: {
//                                            Text("See how this is calculated").font(.callout)
//                                            Image(systemName: "arrowtriangle.down.fill").resizable().frame(width: 8, height: 6)
//                                        }).tint(Color("DarkShade")).frame(width: 230, height: 30).overlay {
//                                            RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("DarkShade"),lineWidth: 1)
//                                        }.padding(.leading, 25).padding(.bottom,8)
//                                        Spacer()
//                                    }
//                                    if showButtonDetails{
//                                        HStack{
//                                            VStack(alignment:.leading){
//                                                Text("Base fee")
//                                                Text("Long distance fee").font(.callout).lineLimit(1)
//                                                Text("Small order fee")
//                                            }
//                                            
//                                            Spacer()
//                                            
//                                            VStack(alignment: .trailing){
//                                                Text("₹47")
//                                                Text("₹7")
//                                                Text("₹87")
//                                                
//                                            }
//                                        }
//                                        Divider()
//                                        HStack{
//                                            Text("Grand Total").frame(maxWidth: .infinity, alignment: .leading)
//                                            Text("$\(String(grandTotalPrice))")
//                                        }.padding().frame(maxWidth: .infinity).background(.white).cornerRadius(15)
//                                    }
//                                    Divider()
//                                    HStack{
//                                        Text("Grand Total").frame(maxWidth: .infinity, alignment: .leading)
//                                        Text("₹\(String(grandTotalPrice))")
//                                    }.fontWeight(.semibold)
//                                }.padding(16).frame(maxWidth: .infinity).background(.white).cornerRadius(15)
//                            }
//                            // NA
//                            
//                            // Your details
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text("Your Details")
//                                        .fontWeight(.semibold)
//                                    Text("Shanaya Sinha, 1234567")
//                                        .foregroundColor(Color.gray)
//                                }
//                                Spacer()
//                                Button(action: {
//                                    
//                                }, label: {
//                                    Image(systemName: "chevron.forward")
//                                        .foregroundColor(Color.gray)
//                                })
//                            }.padding()
//                                .background(Color.white)
//                                .cornerRadius(15)
//                            
//                            // Order for someone else
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text("Order for someone else")
//                                        .fontWeight(.semibold)
//                                    Text("Send personalised message")
//                                        .foregroundColor(Color.gray)
//                                }
//                                Spacer()
//                                Button(action: {
//                                    
//                                }, label: {
//                                    Image(systemName: "chevron.forward")
//                                        .foregroundColor(Color.gray)
//                                })
//                            }.padding()
//                                .background(Color.white)
//                                .cornerRadius(15)
//                            
//                            // Cancellation Policy
//                            
//                            //                        SectionHeader(heading: "")
//                            HStack{
//                                VStack(alignment: .leading){
//                                    Divider().frame(maxWidth: 80 )
//                                }
//                                //                    .frame(width:30,height: 5)
//                                Text("CANCELLATION POLICY")
//                                    .tracking(1)
//                                    .padding()
//                                VStack{
//                                    Divider().frame(maxWidth: 80 )
//                                }
//                            }
//                            HStack{
//                                Text("100% cancellation fee will be applicable if you decide to cancel the order anytime after order placement. Avoid cancellation as it leads to food wastage")
//                                    .foregroundColor(Color.gray)
//                            }.padding()
//                                .background(Color.white)
//                                .cornerRadius(15)
//                        }.padding()
//                    }
//                    
//                    // Bottom Placement View
//                    VStack { // Bottom Payment Option
//                        VStack { // Location Change
//                            HStack {
//                                Image(systemName: "mappin")
//                                    .foregroundColor(Color("DarkShade"))
//                                Text("Delivery at")
//                                    .font(.subheadline)
//                                Text("Work")
//                                    .font(.subheadline)
//                                    .fontWeight(.semibold)
//                                Spacer()
//                                Button("Change") {
//                                    
//                                }.foregroundColor(Color("DarkShade"))
//                            }
//                                .font(.caption)
//                                .foregroundColor(Color.gray)
//                                .lineLimit(1)
//                                .padding(.horizontal, 24)
//                        }.padding(.horizontal, 24)
//                        Divider()
//                        VStack { // Place order button view
//                            HStack {
//                                VStack { // FOR Payusing and its label
//                                    HStack {
//                                        Image(systemName: currentPaymentImage)
//                                            .font(.callout)
//                                            .foregroundColor(Color.gray)
//                                        Menu("Pay Using ▲") {
//                                            Button("Wallet") {
//                                                currentPaymentWay = "Wallet"
//                                                currentPaymentImage = "menubar.dock.rectangle"
//                                            }
//                                            Button("COD") {
//                                                currentPaymentWay = "COD"
//                                                currentPaymentImage = "indianrupeesign.circle.fill"
//                                            }
//                                        }
//                                        .foregroundColor(Color.gray)
//                                        .font(.subheadline)
//                                    }
//                                    Text(currentPaymentWay)
//                                        .font(.caption)
//                                }
//                                VStack { // FOR Paynow button
//                                    Button(action: {
//                                        
//                                    }) {
//                                        HStack{
//                                            VStack{
//                                                Text("₹" + String(totalAmount))
//                                                    .foregroundColor(Color.white)
//                                                Text("TOTAL")
//                                                    .foregroundColor(Color.white)
//                                                    .font(.caption)
//                                            }.padding(.leading, 12)
//                                            Spacer()
//                                            Text("Place Order ►")
//                                                .foregroundColor(Color.white)
//                                            Spacer()
//                                        }
//                                    }
//                                    .padding(.vertical, 12)
//                                    .background(Color("DarkShade"))
//                                    .cornerRadius(8)
//                                }
//                            }
//                            .padding(.vertical, 8)
//                            .padding(.horizontal, 24)
//                            Divider()
//                        }.onAppear() {
//                            updateBillinigDetails()
//                        }
//                    }
//                    .padding(.top, 12)
//                    .background(Color.white)
//                    //                .cornerRadius(20, corners: [.topLeft, .topRight])
//                }
//            }
//        }.padding(.top,70).overlay(HeaderContent(pageTitle: "Cart"))
//    }
//    
//    func updateCartItems(id: UUID, inc: Bool) {
//        var ind: Int = -1
//        for i in 0..<items.count {
//            if(items[i].id == id) {
//                ind = i
//                break
//            }
//        }
//        if inc {
//            items[ind].counter += 1
//        } else {
//            items[ind].counter -= 1
//        }
//        
//        items[ind].totalPrice = items[ind].price * Double(items[ind].counter)
//        updateBillinigDetails()
//    }
//    
//    func deleteCartItem(id: UUID) {
//        var ind = -1
//        for i in 0..<items.count {
//            if(items[i].id == id) {
//                ind = i
//                break
//            }
//        }
//        if ind != -1 {
//            items.remove(at: ind)
//        } else {
//            print("ID not found")
//        }
//        updateBillinigDetails()
//    }
//    
//    func updateBillinigDetails() {
//        var newSubTotal = 0.0
//        for item in items {
//            newSubTotal += item.totalPrice
//        }
//        subTotalPrice = newSubTotal
//        gstPrice = 0.18 * subTotalPrice
//        deliveryCharges = 50
//        totalAmount = subTotalPrice + gstPrice + deliveryCharges
//        grandTotalPrice = totalAmount
//    }
//    
//    func calculateTime(distance: Int) -> String {
//        return "25-30 min"
//    }
//    func loadCartItems(){
//        for user in users{
//            if user.email == UserDefaults.standard.value(forKey: "userEmail") as? String{
//                cartItems = user.cartItem!.allObjects as! [Cart]
//            }
//        }
//        
//    }
//}
//
//struct CartPage_Previews: PreviewProvider {
//    static var previews: some View {
//        CartPage(tabSelected: .constant(0))
//    }
//}
//
