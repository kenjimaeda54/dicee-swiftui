# Dicee
Aplicativo simples,ideia e jogar dois dados aleatoriamente conforme clica em um botao de sortear

## Feature
- Em SwiftUI quando deseja espaçar os componentes conforme toda a tela pode usar o Spacer()
- Para lidar com imutabilidade nos usamos o State, abordagem diferente de UIKIT que marcamos como imutável a struct
- Caso não inicia a variável com algum valor, construtor da struct  exigira inicialização 
- Resizable e importante para redmensionarmos uma imagem

```swift

import SwiftUI

struct ContentView: View {
	
	let collectionImg: [Int:String] = [1:"DiceOne",2:"DiceTwo",3:"DiceThree",4:"DiceFour",5:"DiceFive",6:"DiceSix"]

	
	@State var imgOne = "DiceOne";
	@State var imgTwo =  "DiceOne";

	
	
	var body: some View {
		ZStack {
			Image("GreenBackground")
				.resizable()
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				
				Image("DiceeLogo")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 200,height: 200)
				Spacer()
				
				HStack {
					Dicee(img:imgOne)
					Dicee(img:imgTwo)
					
				}
				Spacer()
				
				Button(action: {
					imgOne = collectionImg[Int.random(in: 1...6)]!
					imgTwo = collectionImg[Int.random(in: 1...6)]!
					
				}, label: {
					Text("Rool")
						.foregroundColor(.white)
						.font(.system(size: 40))
						.fontWeight(.bold)
						.padding(.horizontal)
				})
				.background(.red)
				.padding(EdgeInsets(top: 0, leading: 0, bottom: 35, trailing: 0))
			}
			
		}
	}
}

struct Dicee: View {
	let img: String
	
	var body: some View {
		Image(img)
			.resizable()
			.aspectRatio(1,contentMode: .fit)
			.padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

```
