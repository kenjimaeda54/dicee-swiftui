//
//  ContentView.swift
//  Dicee
//
//  Created by kenjimaeda on 25/11/22.
//

import SwiftUI

struct ContentView: View {
	
	let collectionImg: [Int:String] = [1:"DiceOne",2:"DiceTwo",3:"DiceThree",4:"DiceFour",5:"DiceFive",6:"DiceSix"]
	//struct e imutavel em UIKIT marcamos @mutation aqui a propriedade e State
	
	@State var imgOne = "DiceOne";
	@State var imgTwo =  "DiceOne";

	
	
	var body: some View {
		ZStack {
			Image("GreenBackground")
			//resizable e importante para imagem redimensionar imagem
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
					//padding fica no texto
					//conceito de padding e muito simalar a margin em web
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

