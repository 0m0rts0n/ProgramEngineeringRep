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
    public class AnalyzesController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Analyzes
        public ActionResult Index()
        {
            return View(db.Analyzes.ToList());
        }

        // GET: Analyzes/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Analyze analyze = db.Analyzes.Find(id);
            if (analyze == null)
            {
                return HttpNotFound();
            }
            return View(analyze);
        }

        // GET: Analyzes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Analyzes/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AnalysisID,AnalysisType")] Analyze analyze)
        {
            if (ModelState.IsValid)
            {
                analyze.AnalysisID = Guid.NewGuid();
                db.Analyzes.Add(analyze);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(analyze);
        }

        // GET: Analyzes/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Analyze analyze = db.Analyzes.Find(id);
            if (analyze == null)
            {
                return HttpNotFound();
            }
            return View(analyze);
        }

        // POST: Analyzes/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AnalysisID,AnalysisType")] Analyze analyze)
        {
            if (ModelState.IsValid)
            {
                db.Entry(analyze).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(analyze);
        }

        // GET: Analyzes/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Analyze analyze = db.Analyzes.Find(id);
            if (analyze == null)
            {
                return HttpNotFound();
            }
            return View(analyze);
        }

        // POST: Analyzes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Analyze analyze = db.Analyzes.Find(id);
            db.Analyzes.Remove(analyze);
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
