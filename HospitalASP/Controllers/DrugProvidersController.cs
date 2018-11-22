using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HospitalASP;

namespace HospitalASP.Controllers
{
    public class DrugProvidersController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: DrugProviders
        public ActionResult Index()
        {
            return View(db.DrugProviders.ToList());
        }

        // GET: DrugProviders/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DrugProvider drugProvider = db.DrugProviders.Find(id);
            if (drugProvider == null)
            {
                return HttpNotFound();
            }
            return View(drugProvider);
        }

        // GET: DrugProviders/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: DrugProviders/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DrugProviderID,ProviderName,ProviderCountry")] DrugProvider drugProvider)
        {
            if (ModelState.IsValid)
            {
                drugProvider.DrugProviderID = Guid.NewGuid();
                db.DrugProviders.Add(drugProvider);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(drugProvider);
        }

        // GET: DrugProviders/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DrugProvider drugProvider = db.DrugProviders.Find(id);
            if (drugProvider == null)
            {
                return HttpNotFound();
            }
            return View(drugProvider);
        }

        // POST: DrugProviders/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DrugProviderID,ProviderName,ProviderCountry")] DrugProvider drugProvider)
        {
            if (ModelState.IsValid)
            {
                db.Entry(drugProvider).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(drugProvider);
        }

        // GET: DrugProviders/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DrugProvider drugProvider = db.DrugProviders.Find(id);
            if (drugProvider == null)
            {
                return HttpNotFound();
            }
            return View(drugProvider);
        }

        // POST: DrugProviders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            DrugProvider drugProvider = db.DrugProviders.Find(id);
            db.DrugProviders.Remove(drugProvider);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
