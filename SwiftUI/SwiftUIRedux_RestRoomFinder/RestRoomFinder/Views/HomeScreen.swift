//
//  Actions.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 10/15/24.
//

import SwiftUI
import Combine

struct HomeScreen: View {
    
    @EnvironmentObject var store: Store<AppState>

    @ObservedObject private var locationManager = LocationManager()
    @State private var cancellables: AnyCancellable? = nil
    
    struct Props {
        let restrooms: [Restroom]
        let onFetchRestroomsByLatLong: (Double, Double) -> Void
    }
    
    private func map(state: RestRoomState) -> Props {
        Props(restrooms: state.restrooms) { lat, long in
            store.dispatch(action: FetchRestroomsAction(latitude: lat, longitude: long))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.restrooms)
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }
            .frame(maxWidth: .infinity, maxHeight: 44)
            Spacer()
            HStack {
                Text("Restrooms")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    Spacer()
                Button {
                    locationManager.updateLocation()
                } label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            List(props.restrooms) { restroom in
                RestroomListRow(restroom: restroom)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.880972445, green: 0.3729454875, blue: 0.2552506924, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.cancellables = locationManager.$location.sink { location in
                if let location {
                    props.onFetchRestroomsByLatLong(
                        location.coordinate.latitude,
                        location.coordinate.longitude
                    )
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(
            reducer: appReducer,
            state: AppState(),
            middlewares: [restroomMiddleware()]
        )
        HomeScreen()
            .environmentObject(store)
    }
}
