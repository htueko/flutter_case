import 'package:flutter_case/common/data/local/app_database.dart';
import 'package:flutter_case/common/data/local/model/cache_country.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  setUpAll(() {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  });

  /// insert into db, return true
  test('insert app database test', () async {
    // given
    var db = AppDatabase.instance;
    var data = CacheCountry(
        code: 'MM', name: 'Myanmar', region: 'Asia', isFavourite: false);
    db.insertCountry(data);
    // when
    var result = await db.getCountries();
    // then
    expect(result[0].code, data.code);
    //await db.close();
  });

  /// insert into db, update the data, return true
  test('update app database test', () async {
    // given
    var db = AppDatabase.instance;
    var v1 = CacheCountry(
        code: 'MM', name: 'Myanmar', region: 'Asia', isFavourite: false);
    db.insertCountry(v1);
    var v2 = CacheCountry(
        code: 'MM', name: 'Myanmar', region: 'Asia', isFavourite: true);
    db.updateCountry(v2);
    // when
    var result = await db.getCountries();
    // then
    expect(result[0].isFavourite, v2.isFavourite);
    await db.close();
  });
}
