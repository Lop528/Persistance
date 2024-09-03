import SwiftUI

struct ToDoItem: Identifiable {
    let id = UUID()
    var text: String
    var date: Date
}

struct ToDoListView: View {
    @State private var items: [ToDoItem] = []
    @State private var newItemText: String = ""
    @State private var newItemDate: Date = Date()
    
    var body: some View {
        ZStack{
            List {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.text)
                                .font(.headline)
                            Text(item.date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            deleteItem(item: item)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .onDelete(perform: deleteItems)
            }
            ZStack {
                List {
                    ForEach(items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.text)
                                    .font(.headline)
                                Text(item.date, style: .date)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: {
                                deleteItem(item: item)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }

                    }
                    .onDelete(perform: deleteItems)

                }

                
                
                       RoundedRectangle(cornerRadius: 60)
                           .stroke(Color.cyan, lineWidth: 15)
                           .ignoresSafeArea()
                           .background(
                               RoundedRectangle(cornerRadius: 60)
                                   .fill(Color.clear)
                           )
                           .shadow(color: Color.blue.opacity(1), radius: 15, x: 0, y: 0)
                           .padding(3)
                           .ignoresSafeArea()
                    
                   }
            VStack {
                

                
                Spacer()
                VStack{
                    HStack {
                        TextField("Enter new item", text: $newItemText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        
                        
                        Button(action: {
                            addItem()
                        }) {
                            Text("Add")
                                .padding()
                        }
                    }
                    .frame(width: 350)
                    DatePicker("Date", selection: $newItemDate, displayedComponents: .date)
                        .labelsHidden()
                }
            }
        }
    }
    
    private func addItem() {
        let trimmedItemText = newItemText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedItemText.isEmpty {
            let newItem = ToDoItem(text: trimmedItemText, date: newItemDate)
            items.append(newItem)
            newItemText = ""
            newItemDate = Date()
        }
    }
    
    private func deleteItem(item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

#Preview {
    ToDoListView()
}
